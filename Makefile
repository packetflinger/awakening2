#
# awaken2 makefile (adaped from BANG makefile (quadz))
# Intended for gcc/Linux, may need modifying for other platforms
#

ARCH=i386
CC=gcc
BASE_CFLAGS=-m32 -Dstricmp=strcasecmp

#use these cflags to optimize it
#CFLAGS=$(BASE_CFLAGS) -m486 -O6 -ffast-math -funroll-loops \
#	-fomit-frame-pointer -fexpensive-optimizations -malign-loops=2 \
#	-malign-jumps=2 -malign-functions=2
#use these when debugging 
CFLAGS=$(BASE_CFLAGS) -O2 -g

LDFLAGS=-ldl -lm
SHLIBEXT=so
SHLIBCFLAGS=-fPIC
SHLIBLDFLAGS=-shared

DO_CC=$(CC) $(CFLAGS) $(SHLIBCFLAGS) -o $@ -c $<

#############################################################################
# SETUP AND BUILD
# GAME
#############################################################################

.c.o:
	$(DO_CC)

GAME_OBJS = \
g_bot.o \
g_camera.o \
g_chase.o \
g_cmds.o \
g_combat.o \
g_func.o \
g_items.o \
g_main.o \
g_menus.o \
g_misc.o \
g_model.o \
g_monster.o \
g_phys.o \
g_save.o \
g_spawn.o \
g_svcmds.o \
g_target.o \
g_team.o \
g_trigger.o \
g_turret.o \
g_utils.o \
g_weapon.o \
p_client.o \
p_hud.o \
p_menu.o \
p_view.o \
p_weapon.o \
q_shared.o

game$(ARCH).$(SHLIBEXT) : $(GAME_OBJS)
	$(CC) $(CFLAGS) $(SHLIBLDFLAGS) -o $@ $(GAME_OBJS)


#############################################################################
# MISC
#############################################################################

clean:
	-rm -f $(GAME_OBJS)

depend:
	gcc -MM $(GAME_OBJS:.o=.c)


install:
	cp gamei386.so ../quake2/awaken2

#
# From "make depend"
#

