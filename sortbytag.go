package main

type FloatPair struct {
    data interface{}
    value float32
}

type ByTag []FloatPair

func (a ByTag) Len() int { return len(a)}
func (a ByTag) Swap(i, j int) { a[i], a[j] = a[j], a[i]}
func (a ByTag) Less(i, j int) bool { return a[i].value < a[j].value}
