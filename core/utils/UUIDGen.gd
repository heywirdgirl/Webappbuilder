# core/utils/UUIDGen.gd
extends Node

func v4() -> String:
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	var b := []
	for i in 16:
		b.append(rng.randi() % 256)
	b[6] = (b[6] & 0x0f) | 0x40
	b[8] = (b[8] & 0x3f) | 0x80
	return "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x" % b
