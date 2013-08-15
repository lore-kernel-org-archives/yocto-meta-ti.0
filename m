Return-Path: <kgy@teledigit.eu>
Received: from teledigit.eu (teledigit.eu [195.56.148.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4FEB9E013EC
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 01:00:47 -0700 (PDT)
X-AuthUser: kgy@teledigit.eu
Received: from kgy-pc.localnet ([46.107.59.216]:47671)
	by teledigit.eu with [XMail 1.27 ESMTP Server]
	id <S2C00C> for <meta-ti@yoctoproject.org> from <kgy@teledigit.eu>;
	Thu, 15 Aug 2013 10:00:11 +0200
From: Kovesdi Gyorgy <kgy@teledigit.eu>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Date: Thu, 15 Aug 2013 10:59:38 +0200
Message-ID: <1691947.9O1jKouG89@kgy-pc>
User-Agent: KMail/4.8.5 (Linux/3.4.47-2.38-desktop; KDE/4.8.5; i686; ; )
MIME-Version: 1.0
Subject: Cannot compile libgles-omap3_4.05.00.03
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Aug 2013 08:00:52 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

Using current Poky, i tried to compile it for my Beagleboard, and got t=
he=20
following error:

ERROR: debugedit failed with exit code 256 (cmd was=20
'/home/kgy/work/Yocto/poky/build/out/sysroots/i686-
linux/usr/lib/rpm/bin/debugedit' -b=20
'/home/kgy/work/Yocto/poky/build/out/work/armv7a-vfp-neon-poky-linux-gn=
ueabi'=20
-d '/usr/src/debug' -i -l '/home/kgy/work/Yocto/poky/build/out/work/arm=
v7a-
vfp-neon-poky-linux-gnueabi/libgles-omap3/4.05.00.03-r35/debugsources.l=
ist'=20
'/home/kgy/work/Yocto/poky/build/out/work/armv7a-vfp-neon-poky-linux-
gnueabi/libgles-omap3/4.05.00.03-r35/package/usr/bin/ES3.0/xmultiegltes=
t'):
/home/kgy/work/Yocto/poky/build/out/sysroots/i686-
linux/usr/lib/rpm/bin/debugedit: canonicalization unexpectedly shrank b=
y one=20
character
ERROR: Function failed: split_and_strip_files
ERROR: Logfile of failure stored in:=20
/home/kgy/work/Yocto/poky/build/out/work/armv7a-vfp-neon-poky-linux-
gnueabi/libgles-omap3/4.05.00.03-r35/temp/log.do_package.17677
ERROR: Task 275 (/home/kgy/work/Yocto/poky/meta-ti/recipes-
graphics/libgles/libgles-omap3_4.05.00.03.bb, do_package) failed with e=
xit=20
code '1'

On the net i found this problem: in a file path there is a double slash=
 (//)=20
which cannot be handled by debugedit. (IMHO debugedit is buggy) Because=
 all=20
other things seem good, the problem must be in this recipe. However, i =
could=20
not find suspicious entries in the recipe nor in the includes.

Regards
Gy=F6rgy K=F6vesdi


