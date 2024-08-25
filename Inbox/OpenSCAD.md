#dev #3d

# Info
- https://openscad.org/cheatsheet/

# Modelling

## Пример
```
//Создание ножки для столика, которые вставляются друг в друга
//diameter
diam_hole = 21;
diam_buttom = diam_hole-5;
diam_full = diam_hole+5;
//height
height_buttom = 35;
height_top = 25;
difference(){
    cylinder($fn=100,h=height_buttom,d=diam_hole);
    cylinder($fn=100,h=height_buttom+1,d=diam_buttom);
}
translate([0,0,height_buttom]){
    difference(){
        cylinder($fn=100,h=height_top,d1=diam_hole,d2=diam_full);
        cylinder($fn=100,h=height_top,d1=diam_hole-4,d2=diam_hole);
    }
}
```

## Базовые команды создание 2D объектов
```
circle(radius | d=diameter)	создает круг
square(size,center)
square([width,height],center)	создает квадрат или прямоугольник
polygon([points],[paths])	создает многоугольник на основании предоставленных точек
text(“текст”,6,”Arial:style=Black”);
```

## Логические операции с объектами
```
union() – выполняет объединение моделей внутри данного блока.
difference() – выполняет вычитание моделей внутри данного блока.
intersection() – выполняет пересечение моделей внутри данного блока.
```

## Управление формой и размерами объектов:
```
translate([x, y, z]) – перемещает объект в указанное положение.
rotate([x, y, z]) – вращает объект вокруг указанных осей.
scale([x, y, z]) – масштабирует объект по указанным осям.
resize([x, y, z]) – изменяет размеры объекта с учетом коэффициентов масштабирования.
```