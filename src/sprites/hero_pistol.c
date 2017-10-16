#include "hero_pistol.h"
// Data created with Img2CPC - (c) Retroworks - 2007-2015
// Palette uses hardware values.
const u8 sprite_palette[16] = { 0x54, 0x44, 0x5c, 0x4c, 0x45, 0x56, 0x5e, 0x40, 0x5f, 0x4e, 0x47, 0x52, 0x42, 0x4a, 0x43, 0x4b };

// Tile sprite_hero_pistol: 18x25 pixels, 9x25 bytes.
const u8 sprite_hero_pistol[9 * 25] = {
	0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0xc0, 0xc0, 0x80, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x01, 0x03, 0x03, 0x03, 0x00, 0x00, 0x00, 0x00,
	0x00, 0xf0, 0xf0, 0xf0, 0xf0, 0xa0, 0x00, 0x00, 0x00,
	0x51, 0xf3, 0xf3, 0xf3, 0xf3, 0xf3, 0x00, 0x00, 0x00,
	0x73, 0xc3, 0xc3, 0xc3, 0xc3, 0xc3, 0x82, 0x00, 0x00,
	0x73, 0xc6, 0xcc, 0xcc, 0xcc, 0xcc, 0x88, 0x00, 0x00,
	0x73, 0xc6, 0x3f, 0x3f, 0x3f, 0x3f, 0x08, 0x00, 0x00,
	0x73, 0xc6, 0x3f, 0x3f, 0x3f, 0x3f, 0x08, 0x00, 0x00,
	0x26, 0x4c, 0x3f, 0x3f, 0x3f, 0x3f, 0x08, 0x00, 0x00,
	0x26, 0x6e, 0x2a, 0x3f, 0x3f, 0x2a, 0x08, 0x00, 0x00,
	0x26, 0x4c, 0x3f, 0x2e, 0x0c, 0x3f, 0x08, 0x00, 0x00,
	0x04, 0x3f, 0x3f, 0x3f, 0x3f, 0x3f, 0x08, 0x00, 0x00,
	0x00, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x00, 0x00, 0x08,
	0x00, 0x00, 0x14, 0x0c, 0x1c, 0x54, 0xac, 0x5c, 0xfc,
	0x00, 0x3c, 0x14, 0x3d, 0x3e, 0x54, 0x5c, 0xfc, 0xfc,
	0x14, 0x0c, 0x00, 0x3c, 0x3c, 0x0c, 0x08, 0x0c, 0x08,
	0x04, 0x3f, 0x08, 0x3c, 0x3c, 0x2e, 0x04, 0x08, 0x00,
	0x04, 0x3f, 0x08, 0x3c, 0x3c, 0x08, 0x1d, 0x00, 0x00,
	0x00, 0x0c, 0x14, 0x3c, 0x3c, 0x0c, 0x2a, 0x00, 0x00,
	0x00, 0x00, 0xbc, 0x3c, 0x7c, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0xfc, 0x3c, 0xfc, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0xfc, 0x41, 0xfc, 0x41, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};

