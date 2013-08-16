Return-Path: <kgy@teledigit.eu>
Received: from teledigit.eu (teledigit.eu [195.56.148.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F157CE01445
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 03:30:47 -0700 (PDT)
X-AuthUser: kgy@teledigit.eu
Received: from kgy-pc.localnet ([46.107.59.216]:59066)
	by teledigit.eu with [XMail 1.27 ESMTP Server]
	id <S2C326> for <meta-ti@yoctoproject.org> from <kgy@teledigit.eu>;
	Fri, 16 Aug 2013 12:30:09 +0200
From: Kovesdi Gyorgy <kgy@teledigit.eu>
To: meta-ti@yoctoproject.org
Date: Fri, 16 Aug 2013 13:29:38 +0200
Message-ID: <2113186.vdo30XAQlh@kgy-pc>
User-Agent: KMail/4.8.5 (Linux/3.4.47-2.38-desktop; KDE/4.8.5; i686; ; )
In-Reply-To: <1691947.9O1jKouG89@kgy-pc>
References: <1691947.9O1jKouG89@kgy-pc>
MIME-Version: 1.0
Subject: Re: Cannot compile libgles-omap3_4.05.00.03
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
X-List-Received-Date: Fri, 16 Aug 2013 10:30:48 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

> ERROR: debugedit failed with exit code 256 (cmd was
> '/home/kgy/work/Yocto/poky/build/out/sysroots/i686-
> linux/usr/lib/rpm/bin/debugedit' -b
> '/home/kgy/work/Yocto/poky/build/out/work/armv7a-vfp-neon-poky-linux-=
gnueabi
> ' -d '/usr/src/debug' -i -l
> '/home/kgy/work/Yocto/poky/build/out/work/armv7a-
> vfp-neon-poky-linux-gnueabi/libgles-omap3/4.05.00.03-r35/debugsources=
.list'
> '/home/kgy/work/Yocto/poky/build/out/work/armv7a-vfp-neon-poky-linux-=

> gnueabi/libgles-omap3/4.05.00.03-r35/package/usr/bin/ES3.0/xmultieglt=
est'):
> /home/kgy/work/Yocto/poky/build/out/sysroots/i686-
> linux/usr/lib/rpm/bin/debugedit: canonicalization unexpectedly shrank=
 by one
> character
It is very strange, because the command mentioned in the error message =
can be=20
executed from commandline without any error.

Regards
Gy=F6rgy K=F6vesdi


