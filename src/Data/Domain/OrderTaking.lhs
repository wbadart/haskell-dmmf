---
title: The Order-Taking Domain
author: Will Badart
date: \today
---

The central case study of *Domain Modeling Made Functional* is the domain or
**order taking**. The order-taking domain is concerned with taking in and
processing order forms, preparing the relevant data for the billing and
shipping departments to execute their respective parts of fulfilling the order.

> {-# LANGUAGE StandaloneDeriving #-}
> module Data.Domain.OrderTaking where
> import Data.Domain.Util
> import Validation

Our first stab at understanding the order-taking domain starts in Chapter 2,
*Understanding the Domain*, when we interview our resident order-taking domain
expert, Ollie.

We learned from Ollie that there are two broad categories of product: a
*widget* and a *gizmo*.

> data ProductCode = Widget WidgetCode
>                  | Gizmo GizmoCode

Widgets are sold by the unit, and their product codes are a "`W`" followed by 4
digits:

> newtype WidgetCode = WidgetCode String
> widgetCode s =
>   Success (WidgetCode s)
>     <* failureIf (prefix s /= 'W') BadWidgetPrefix
>     <* failureIf (length s /= 5)   WidgetCodeNot4Digits

Meanwhile, gizmos are sold by the kilogram, and their product codes are a "`G`"
followed by 3 digits:

> newtype GizmoCode = GizmoCode String
> gizmoCode s =
>   Success (GizmoCode s)
>     <* failureIf (prefix s /= 'G') BadGizmoPrefix
>     <* failureIf (length s /= 4)   GizmoCodeNot3Digits

The domain experts also place some sensible bounds on the quantities of widgets
and gizmos that can be sold at once: 1,000 units of a particular widget at
once, and 100kg of gizmos (with a 0.05kg minimum).

> newtype UnitQuantity = UnitQuantity WholeNumber
> unitQuantity n =
>   Success (UnitQuantity n)
>     <* failureIf (n < 1)    NeedAtLeast1Unit
>     <* failureIf (n > 1000) MaxUnitsExceeded
>
> newtype KilogramQuantity = KilogramQuantity Decimal
> kilogramQuantity n =
>   Success (KilogramQuantity n)
>     <* failureIf (n < 0.05) DoesntMeetMinKg
>     <* failureIf (n > 100)  ExceedsMaxKg

---

\section{Appendix}

\subsection{Error Conditions}

> data WidgetCodeError
>   = BadWidgetPrefix
>   | WidgetCodeNot4Digits
>   deriving Show

> data GizmoCodeError
>   = BadGizmoPrefix
>   | GizmoCodeNot3Digits
>   deriving Show

> data UnitQuantityError
>   = NeedAtLeast1Unit
>   | MaxUnitsExceeded
>   deriving Show

> data KilogramQuantityError
>   = DoesntMeetMinKg
>   | ExceedsMaxKg
>   deriving Show

\subsection{Technical Details}

> deriving instance Show ProductCode
> deriving instance Show WidgetCode
> deriving instance Show GizmoCode
> deriving instance Show UnitQuantity
