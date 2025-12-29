;; • Implement a function called (big st n) that returns true if a string st
;; is longer than n characters.
;; • Write a function called (collection-type col) that returns :list, :map,
;; or :vector based on the type of collection col.

(defn big [st n]
    (> (count st) n))

(println (big "Hello" 4))
(println (big "Hell" 4))

(defn collection-type [col]
    (case (str (type col))
        "class clojure.lang.PersistentList" :list
        "class clojure.lang.PersistentVector" :vector
        "class clojure.lang.PersistentArrayMap" :map))

(println (collection-type '(1 2 3)))
(println (collection-type [1 2 3]))
(println (collection-type {:a "1", :b "2", :c "3"}))

;; clojure -M day_1.clj
