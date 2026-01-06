;; • Implement an unless with an else condition using macros.

(defmacro unless [test then else]
    (list 'if (list 'not test) then else))

(defn is-big? [number]
    (unless (< number 100) "yes" "no"))

(println (is-big? 666))
(println (is-big? 66))

;; • Write a type using defrecord that implements a protocol.

(defprotocol Animal
    (age [x])
    (sound [x]))

(defrecord Cat [age sound]
    Animal
    (age [x] age)
    (sound [x] sound))

(def Felix (Cat. 10 "meow"))
(def Tommy (Cat. 12 "purrr"))

(defn about-cat [{:keys [age sound]}] 
    (str age " yrs old and " sound))

(println (about-cat Felix))
(println (about-cat Tommy))

;; clojure -M day_2.clj
