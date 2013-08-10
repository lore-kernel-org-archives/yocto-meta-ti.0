Return-Path: <kgy@teledigit.eu>
Received: from teledigit.eu (teledigit.eu [195.56.148.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26B6CE0048B
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 08:31:19 -0700 (PDT)
X-AuthUser: kgy@teledigit.eu
Received: from kgy-pc.localnet ([46.107.59.216]:42656)
	by teledigit.eu with [XMail 1.27 ESMTP Server]
	id <S2BC52> for <meta-ti@yoctoproject.org> from <kgy@teledigit.eu>;
	Sat, 10 Aug 2013 17:30:41 +0200
From: Kovesdi Gyorgy <kgy@teledigit.eu>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Date: Sat, 10 Aug 2013 18:30:10 +0200
Message-ID: <1554710.Rp68v4FIpQ@kgy-pc>
User-Agent: KMail/4.8.5 (Linux/3.4.47-2.38-desktop; KDE/4.8.5; i686; ; )
MIME-Version: 1.0
Subject: Problem compiling libgles-omap3_4.09.00.01
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
X-List-Received-Date: Sat, 10 Aug 2013 15:31:24 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

I have no luck with libgles-omap3 too :-(
Trying to use the recent versions of meta-ti and poky, i got the follow=
ing=20
error:

ERROR: QA Issue: File '/usr/lib/libsrv_init.so.1.9.2188537' from libgle=
s-omap3=20
was already stripped, this will prevent future debugging!
....... (a lot of other similar files are mentioned here) .......
Summary: 1 task failed:
  /home/kgy/work/Yocto/poky/meta-ti/recipes-graphics/libgles/libgles-
omap3_4.09.00.01.bb, do_package

Some time ago, this kind of QA problems was treated as warnings - as fa=
r as i=20
remember. Currently i don't care about debugging, so it would also good=
 if i=20
could ignore these errors or at least switch them to warning. Is it pos=
sible?

Please help me to resolve it!

Thanx in advance
Gy=F6rgy K=F6vesdi


