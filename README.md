# CubicIntersectionRust

## Web API in Rust 1.81

This is a sample web API application built with Rust 1.81.

#### Process

The endpoint calculates the cubic intersection of two cubic objects. It takes the following parameters:

- `first`: the first cubic object
    - `dimensions`: the dimension of the object
    - `center`: the center point of the object

- `second`: the second cubic object
    - `dimensions`: the dimension of the object
    - `center`: the center point of the object

The response will be a JSON object with the following fields:

- AreTheyColliding: Flag that tell if the two object are collinding
- IntersectedVolume: Value of the intersected volume between the two objects.

##### Request:

```json
{
  "first": {
    "dimensions": {
      "x": 2,
      "y": 2,
      "z": 2
    },
    "center": {
      "x": 0,
      "y": 0,
      "z": 0
    }
  },
  "second": {
    "dimensions": {
      "x": 2,
      "y": 2,
      "z": 2
    },
    "center": {
      "x": 0.5,
      "y": 0.5,
      "z": 0.5
    }
  }
}
```

##### Response:

```json
{
  "AreTheyColliding": true,
  "IntersectedVolume": 3.375
}
```