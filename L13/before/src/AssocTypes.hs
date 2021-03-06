{-# LANGUAGE TypeFamilies #-}
module AssocTypes where
import qualified Expr   as E
import qualified Middle as M
import qualified Typed  as T

-- Survey of our evals:
someEvals :: ( E.Expr      -> E.Value
             , M.ExprB     -> Bool
             , M.ExprI     -> Int
             , M.TypedExpr -> E.Value
             , T.Expr v    -> v
             )
someEvals = (E.eval, M.evalB, M.evalI, M.eval, T.eval)

-- Could we capture all of these instances in a type class? Note that
-- the value type varies with the expression type.

class Eval e where  eval :: e -> someOtherTypeDependingOn e

-- main = do print $ eval E.eOK
--           print $ eval M.eOK
--           print $ eval T.eOK




















-- Alternative "stand-alone" syntax (can be used without a class):
type family Value' a
type instance Value' E.Expr      = E.Value
type instance Value' M.ExprB     = Bool
type instance Value' M.ExprI     = Int
type instance Value' M.TypedExpr = E.Value
type instance Value' (T.Expr v)  = v
