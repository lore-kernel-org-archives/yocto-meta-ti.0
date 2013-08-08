Return-Path: <kgy@teledigit.eu>
Received: from teledigit.eu (teledigit.eu [195.56.148.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCE35E003FA
	for <meta-ti@yoctoproject.org>; Thu,  8 Aug 2013 07:02:10 -0700 (PDT)
X-AuthUser: kgy@teledigit.eu
Received: from kgy-pc.localnet ([46.107.59.216]:43940)
	by teledigit.eu with [XMail 1.27 ESMTP Server]
	id <S2BA3F> for <meta-ti@yoctoproject.org> from <kgy@teledigit.eu>;
	Thu, 8 Aug 2013 16:01:36 +0200
From: Kovesdi Gyorgy <kgy@teledigit.eu>
To: meta-ti@yoctoproject.org
Date: Thu, 08 Aug 2013 17:01:06 +0200
Message-ID: <25485758.4HajCtvkOA@kgy-pc>
User-Agent: KMail/4.8.5 (Linux/3.4.47-2.38-desktop; KDE/4.8.5; i686; ; )
In-Reply-To: <20130807185504.GD23226@edge>
References: <1477888.0bvqrzpNgz@kgy-pc> <20130807185504.GD23226@edge>
MIME-Version: 1.0
Subject: Re: Select proper versions for Beagleboard-C4
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
X-List-Received-Date: Thu, 08 Aug 2013 14:02:12 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

> I'm not sure about your setup, since 4.05.00.03 is super old.
> 4.08.* is more recent, but still not the latest.
> 4.09.* seems to work fine with latest 3.2-3.8 kernels.

The 4.08 and 4.09 versions still cannot be compiled in my environment (=
3.8.13=20
kernel):

GFX_Linux_KM/services4/3rdparty/linux_drm/pvr_drm_stubs.o
| make[3]: *** No rule to make target `/home/kgy/work/Angstrom/try-007-=

X/build/tmp-angstrom_v2012_12-eglibc/work/beagleboard-angstrom-linux-
gnueabi/omap3-sgx-modules-4.09.00.01-
r122a/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm=
/drm_auth.o',=20
needed by `/home/kgy/work/Angstrom/try-007-X/build/tmp-angstrom_v2012_1=
2-
eglibc/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modules-4.09.0=
0.01-
r122a/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm=
/drm.o'. =20
Stop.

The file drm_auth.o is in the kernel tree at drivers/gpu/drm/drm_auth.o=
, so i=20
think it is a kind of dependency problem, please help me to resolve it!=


Thanx
Gy=F6rgy K=F6vesdi


