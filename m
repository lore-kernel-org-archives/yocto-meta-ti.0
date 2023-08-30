Return-Path: <anthony@ajmartinez.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A9CC83F15
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 18:03:40 +0000 (UTC)
Subject: poky [kirkstone] + systemd fails to mount /boot on beaglebone machine - missing nls_ascii?
To: meta-ti@lists.yoctoproject.org
From: "Anthony Martinez" <anthony@ajmartinez.com>
X-Originating-Location: Damon, Texas, US (135.26.88.21)
X-Originating-Platform: Linux Firefox 102
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 30 Aug 2023 11:03:32 -0700
Message-ID: <rfsd.1693418612952357533.5JKj@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Aug 2023 18:03:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16908

Hi All,

I'm trying to get poky to run properly with systemd on a Beaglebone Black, =
and I've hit a hitch I can't seem to resolve. What I've done is:

- Clone `meta-arm` and `meta-ti` under `poky`
- Create and checkout a new `bbb-kirkstone` tracking `origin/kirkstone` bra=
nches in `poky`, `meta-arm` and `meta-ti`
- Added the paths to `meta-arm/meta-arm`, `meta-arm/meta-arm-toolchain`, an=
d `meta-ti/meta-ti-bsp` to `BBLAYERS` in `poky/build/conf/bblayers.conf`
- Set the following in `poky/build/conf/local.conf`

```
MACHINE ?=3D "beaglebone"
DISTRO_FEATURES:append =3D " systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
INIT_MANAGER =3D "systemd"
VIRTUAL_RUNTIME_init_manager =3D "systemd"
VIRTUAL_RUNTIME_initscripts =3D "systemd-compat-units"
```

After I run `bitbake core-image-base`, and write the resulting image to SD =
this is what I get on the console at boot:
```
[   15.964307] FAT-fs (mmcblk0p1): IO charset ascii not found
[FAILED] Failed to mount /boot.
See 'systemctl status boot.mount' for details.
[DEPEND] Dependency failed for Local File Systems.

```

From here, I've got a system in `maintenance` mode with no `/boot` mounted.

If I look in `poky/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb.or=
g/5.10.162+gitAUTOINC+982fde4eb3-r0/image/boot` I find the following option=
s in the config:
```
poky/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb.org/5.10.162+git=
AUTOINC+982fde4eb3-r0/image/boot$ grep FAT config-5.10.162+=20
# DOS/FAT/EXFAT/NT Filesystems
CONFIG_FAT_FS=3Dy
CONFIG_VFAT_FS=3Dy
CONFIG_FAT_DEFAULT_CODEPAGE=3D437
CONFIG_FAT_DEFAULT_IOCHARSET=3D"ascii"
CONFIG_FAT_DEFAULT_UTF8=3Dy
CONFIG_EXFAT_FS=3Dm
CONFIG_EXFAT_DEFAULT_IOCHARSET=3D"utf8"
# end of DOS/FAT/EXFAT/NT Filesystems

poky/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb.org/5.10.162+git=
AUTOINC+982fde4eb3-r0/image/boot$ grep CONFIG_NLS config-5.10.162+=20
CONFIG_NLS=3Dy
CONFIG_NLS_DEFAULT=3D"utf8"
CONFIG_NLS_CODEPAGE_437=3Dm
CONFIG_NLS_CODEPAGE_737=3Dm
CONFIG_NLS_CODEPAGE_775=3Dm
CONFIG_NLS_CODEPAGE_850=3Dm
CONFIG_NLS_CODEPAGE_852=3Dm
CONFIG_NLS_CODEPAGE_855=3Dm
CONFIG_NLS_CODEPAGE_857=3Dm
CONFIG_NLS_CODEPAGE_860=3Dm
CONFIG_NLS_CODEPAGE_861=3Dm
CONFIG_NLS_CODEPAGE_862=3Dm
CONFIG_NLS_CODEPAGE_863=3Dm
CONFIG_NLS_CODEPAGE_864=3Dm
CONFIG_NLS_CODEPAGE_865=3Dm
CONFIG_NLS_CODEPAGE_866=3Dm
CONFIG_NLS_CODEPAGE_869=3Dm
CONFIG_NLS_CODEPAGE_936=3Dm
CONFIG_NLS_CODEPAGE_950=3Dm
CONFIG_NLS_CODEPAGE_932=3Dm
CONFIG_NLS_CODEPAGE_949=3Dm
CONFIG_NLS_CODEPAGE_874=3Dm
CONFIG_NLS_ISO8859_8=3Dm
CONFIG_NLS_CODEPAGE_1250=3Dm
CONFIG_NLS_CODEPAGE_1251=3Dm
CONFIG_NLS_ASCII=3Dm
CONFIG_NLS_ISO8859_1=3Dm
CONFIG_NLS_ISO8859_2=3Dm
CONFIG_NLS_ISO8859_3=3Dm
CONFIG_NLS_ISO8859_4=3Dm
CONFIG_NLS_ISO8859_5=3Dm
CONFIG_NLS_ISO8859_6=3Dm
CONFIG_NLS_ISO8859_7=3Dm
CONFIG_NLS_ISO8859_9=3Dm
CONFIG_NLS_ISO8859_13=3Dm
CONFIG_NLS_ISO8859_14=3Dm
CONFIG_NLS_ISO8859_15=3Dm
CONFIG_NLS_KOI8_R=3Dm
CONFIG_NLS_KOI8_U=3Dm
CONFIG_NLS_MAC_ROMAN=3Dm
CONFIG_NLS_MAC_CELTIC=3Dm
CONFIG_NLS_MAC_CENTEURO=3Dm
CONFIG_NLS_MAC_CROATIAN=3Dm
CONFIG_NLS_MAC_CYRILLIC=3Dm
CONFIG_NLS_MAC_GAELIC=3Dm
CONFIG_NLS_MAC_GREEK=3Dm
CONFIG_NLS_MAC_ICELAND=3Dm
CONFIG_NLS_MAC_INUIT=3Dm
CONFIG_NLS_MAC_ROMANIAN=3Dm
CONFIG_NLS_MAC_TURKISH=3Dm
CONFIG_NLS_UTF8=3Dm
```

The internet suggests that `CONFIG_NLS_ASCII=3Dy` may resolve the issue, bu=
t as I'm quite new to Yocto I'm not sure what the right way to do that woul=
d be. I attempted to start with `devtool modify linux-bb.org`, but was met =
with an immense traceback ending in:
```
Exception: bb.fetch2.FetchError: Fetcher failure for URL: 'git://github.com=
/beagleboard/linux.git;protocol=3Dhttps;branch=3D${BRANCH}'. Please set a v=
alid SRCREV for url ['SRCREV_default:pn-linux-bb.org', 'SRCREV_default', 'S=
RCREV:pn-linux-bb.org', 'SRCREV'] (possible key names are git://github.com/=
beagleboard/linux.git;protocol=3Dhttps;branch=3D${BRANCH}, or use a ;rev=3D=
X URL parameter)
```

Any suggestions as to how I might proceed and resolve this are greatly appr=
eciated.

Regards,
Anthony

