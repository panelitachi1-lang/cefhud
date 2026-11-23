#include <a_samp>
#include <streamer>

#define MAX_CP	300

new ColorCP[MAX_CP][2],cp = -1;

stock CreateColorCP(Float:CordX, Float:CordY, Float:CordZ, interior = 0, vw = 0, color = 0)
{
	if(cp > MAX_CP) return printf("[Инклуд ICCP]: Кол-во созданных чекпоинтов превышает %d.",MAX_CP);
	// Цвета: 0 - Оранжевый, 1 - Желтый, 2 - Зеленый, 3 - Синий, 4 - белый, 5 - желтый	
	cp++;
	ColorCP[cp][1] = CreateDynamicObject(1317,CordX,CordY,CordZ-1, 0.0, 0.0, 0.0, vw, interior, -1, 300);	
	switch(color)
	{
		case 0: SetDynamicObjectMaterial(ColorCP[cp][1], 0, 18646, "matcolours", "red", 0x99FF0000);
		case 1: SetDynamicObjectMaterial(ColorCP[cp][1], 0, 18646, "matcolours", "orange", 0x99FF8000);
		case 2: SetDynamicObjectMaterial(ColorCP[cp][1], 0, 18646, "matcolours", "green", 0x99008000);
		case 3: SetDynamicObjectMaterial(ColorCP[cp][1], 0, 18646, "matcolours", "blue", 0x990000FF);
		case 4: SetDynamicObjectMaterial(ColorCP[cp][1], 0, 18646, "matcolours", "white", 0x99FFFFFF);
		case 5: SetDynamicObjectMaterial(ColorCP[cp][1], 0, 18646, "matcolours", "yellow", 0x99FFFF00);
	}
	printf("Создан цветной чекпоинт. ID: %d",cp);
	return cp;
}

stock DelColorCP(id)
{
	if(!IsValidDynamicCP(ColorCP[id][0])) return 0;
	DestroyDynamicCP(ColorCP[id][0]);
	DestroyDynamicObject(ColorCP[id][1]);
	return 1;
}