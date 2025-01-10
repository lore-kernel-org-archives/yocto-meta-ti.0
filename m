Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F518E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 14:38:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.19905.1736519899600119522
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 06:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 74E7B40B66;
	Fri, 10 Jan 2025 14:38:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u5QD6ScE8U3l; Fri, 10 Jan 2025 14:38:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3C09D40031;
	Fri, 10 Jan 2025 14:38:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 77448164156; Fri, 10 Jan 2025 09:38:14 -0500 (EST)
Date: Fri, 10 Jan 2025 09:38:14 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Chirag Shilwant <c-shilwant@ti.com>, meta-ti@lists.yoctoproject.org,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-ti][master][PATCH] libdce: Fix compile errors
Message-ID: <20250110143814.GC21836@denix.org>
References: <20250109171652.3024-1-reatmon@ti.com>
 <af54e3ed-7354-4872-8c13-612027335cf4@ti.com>
 <d8923ac2-ee6f-418c-917b-85c8a866bb07@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d8923ac2-ee6f-418c-917b-85c8a866bb07@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Jan 2025 14:38:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18176

On Thu, Jan 09, 2025 at 02:03:10PM -0600, Ryan Eatmon via lists.yoctoproj=
ect.org wrote:
>=20
>=20
> On 1/9/2025 1:50 PM, Chirag Shilwant wrote:
> >Hi,
> >On 09/01/25 22:46, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>Added a patch to fix some compile errors:
> >>..=E2=80=8A/git/memplugin_linux.=E2=80=8Ac: In function 'memplugin_al=
loc':
> >>..=E2=80=8A/git/memplugin_linux.=E2=80=8Ac:=E2=80=8A69:=E2=80=8A9: er=
ror: implicit declaration
> >>of function 'dsp_dce_buf_lock' [-Wimplicit-function-declaration]
> >>69 | dsp_dce_buf_lock(1,
> >>ZjQcmQRYFpfptBannerStart
> >>This message was sent from outside of Texas Instruments.
> >>Do not click links or open attachments unless you recognize the
> >>source of this email and know the content is safe.
> >>Report=C2=A0Suspicious
> >><https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uHdqXRfP1m07KyZ=
E3PNDfMzpulZCOH34hVMNBCLRBdzFbdBs5l1f-3NAfQSc-GHKWgxxiFjmDJES7cQVnA$>
> >>ZjQcmQRYFpfptBannerEnd
> >>Added a patch to fix some compile errors:
> >
> >
> >
> >Any particular reasons for fixing the compilation error via a patch
> >rather than updating the sources itself since it lies under git.ti.com=
 [1]
>=20
> Because that repo hasn't been updated in 7 years.  If we want to
> work on getting it updated, then we can remove the patch.  But we
> have a build failure today that we need to resolve.

Probably not critical here, but should Upstream-Status then reflect that =
with=20
Inactive-Upstream [lastcommit: date] ?

https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status


> >[1]: https://git.ti.com/cgit/omapzoom/libdce/
> >
> >--=20
> >Chirag
> >
> >
> >
> >>
> >>../git/memplugin_linux.c: In function 'memplugin_alloc':
> >>../git/memplugin_linux.c:69:9: error: implicit declaration of
> >>function 'dsp_dce_buf_lock' [-Wimplicit-function-declaration]
> >>=C2=A0=C2=A0=C2=A0 69 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 dsp_dce_buf_lock(1, &(h->dma_buf_fd));
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~
> >>../git/memplugin_linux.c:71:9: error: implicit declaration of
> >>function 'dce_buf_lock' [-Wimplicit-function-declaration]
> >>=C2=A0=C2=A0=C2=A0 71 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 dce_buf_lock(1, &(h->dma_buf_fd));
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ^~~~~~~~~~~~
> >>../git/memplugin_linux.c: In function 'memplugin_free':
> >>../git/memplugin_linux.c:91:17: error: implicit declaration of
> >>function 'dsp_dce_buf_unlock' [-Wimplicit-function-declaration]
> >>=C2=A0=C2=A0=C2=A0 91 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dsp_dce_buf_unlock(1, &(=
h->dma_buf_fd));
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~=
~~~~~~~~~
> >>../git/memplugin_linux.c:93:17: error: implicit declaration of
> >>function 'dce_buf_unlock' [-Wimplicit-function-declaration]
> >>=C2=A0=C2=A0=C2=A0 93 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dce_buf_unlock(1, &(h->d=
ma_buf_fd));
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~=
~~~~~
> >>../git/memplugin_linux.c:95:13: error: implicit declaration of
> >>function 'close'; did you mean 'pclose'?
> >>[-Wimplicit-function-declaration]
> >>=C2=A0=C2=A0=C2=A0 95 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 close(h->dma_buf_fd);
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pclose
> >>
> >>and
> >>
> >>../git/libdce_linux.c: In function 'dce_deinit':
> >>../git/libdce_linux.c:90:9: error: implicit declaration of
> >>function 'close'; did you mean 'pclose'?
> >>[-Wimplicit-function-declaration]
> >>=C2=A0=C2=A0=C2=A0 90 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 close(OmapDrm_FD);
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ^~~~~
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 pclose
> >>
> >>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>---
> >>=C2=A0 .../files/0001-linux-Fix-compile-errors.patch | 70 +++++++++++=
++++++++
> >>=C2=A0 .../libdce/libdce_3.00.15.00.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +-
> >>=C2=A0 2 files changed, 74 insertions(+), 1 deletion(-)
> >>=C2=A0 create mode 100644 meta-ti-extras/recipes-multimedia/libdce/fi=
les/0001-linux-Fix-compile-errors.patch
> >>
> >>diff --git a/meta-ti-extras/recipes-multimedia/libdce/files/0001-linu=
x-Fix-compile-errors.patch b/meta-ti-extras/recipes-multimedia/libdce/fil=
es/0001-linux-Fix-compile-errors.patch
> >>new file mode 100644
> >>index 00000000..aaee694d
> >>--- /dev/null
> >>+++ b/meta-ti-extras/recipes-multimedia/libdce/files/0001-linux-Fix-c=
ompile-errors.patch
> >>@@ -0,0 +1,70 @@
> >>+From 23db5f29715b771b8557703f1eea7f1502796d5d Mon Sep 17 00:00:00 20=
01
> >>+From: Ryan Eatmon <reatmon@ti.com>
> >>+Date: Thu, 9 Jan 2025 10:34:17 -0600
> >>+Subject: [PATCH] linux: Fix compile errors
> >>+
> >>+Fix the following compile errors:
> >>+
> >>+../git/memplugin_linux.c:69:9: error: implicit declaration of
> >>function 'dsp_dce_buf_lock' [-Wimplicit-function-declaration]
> >>+=C2=A0=C2=A0 69 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ds=
p_dce_buf_lock(1, &(h->dma_buf_fd));
> >>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~
> >>+../git/memplugin_linux.c:71:9: error: implicit declaration of
> >>function 'dce_buf_lock' [-Wimplicit-function-declaration]
> >>+=C2=A0=C2=A0 71 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc=
e_buf_lock(1, &(h->dma_buf_fd));
> >>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^~~~~~~~~~~~
> >>+../git/memplugin_linux.c: In function 'memplugin_free':
> >>+../git/memplugin_linux.c:91:17: error: implicit declaration of
> >>function 'dsp_dce_buf_unlock' [-Wimplicit-function-declaration]
> >>+=C2=A0=C2=A0 91 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dsp_dce_buf_unlock(1, &(h->=
dma_buf_fd));
> >>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~=
~~~~~~
> >>+../git/memplugin_linux.c:93:17: error: implicit declaration of
> >>function 'dce_buf_unlock' [-Wimplicit-function-declaration]
> >>+=C2=A0=C2=A0 93 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dce_buf_unlock(1, &(h->dma_=
buf_fd));
> >>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~=
~~
> >>+../git/memplugin_linux.c:95:13: error: implicit declaration of
> >>function 'close'; did you mean 'pclose'?
> >>[-Wimplicit-function-declaration]
> >>+=C2=A0=C2=A0 95 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 close(h->dma_buf_fd);
> >>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~
> >>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pclose
> >>+
> >>+and
> >>+
> >>+../git/libdce_linux.c: In function 'dce_deinit':
> >>+../git/libdce_linux.c:90:9: error: implicit declaration of
> >>function 'close'; did you mean 'pclose'?
> >>[-Wimplicit-function-declaration]
> >>+=C2=A0=C2=A0 90 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cl=
ose(OmapDrm_FD);
> >>+
> >>+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>+
> >>+Upstream-Status: Pending
> >>+
> >>+---
> >>+ libdce_linux.c=C2=A0=C2=A0=C2=A0 | 2 ++
> >>+ memplugin_linux.c | 2 ++
> >>+ 2 files changed, 4 insertions(+)
> >>+
> >>+diff --git a/libdce_linux.c b/libdce_linux.c
> >>+index 8bae002..6e4f63d 100644
> >>+--- a/libdce_linux.c
> >>++++ b/libdce_linux.c
> >>+@@ -45,6 +45,8 @@
> >>+ #include "dce_rpc.h"
> >>+ #include "memplugin.h"
> >>+
> >>++#include <unistd.h>
> >>++
> >>+ #define INVALID_DRM_FD (-1)
> >>+
> >>+ static int=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 OmapDrm_FD=C2=A0 =3D INVALID_DRM_FD;
> >>+diff --git a/memplugin_linux.c b/memplugin_linux.c
> >>+index 5543a68..59b3658 100644
> >>+--- a/memplugin_linux.c
> >>++++ b/memplugin_linux.c
> >>+@@ -33,6 +33,9 @@
> >>+ #include "memplugin.h"
> >>+ #include "dce_priv.h"
> >>+
> >>++#include "libdce.h"
> >>++#include <unistd.h>
> >>++
> >>+ extern struct omap_device=C2=A0=C2=A0 *OmapDev;
> >>+
> >>+
> >>+--
> >>+2.17.1
> >>+
> >>diff --git
> >>a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> >>b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> >>index f46d9c77..998d3ff6 100644
> >>--- a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> >>+++ b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> >>@@ -6,7 +6,10 @@ inherit autotools pkgconfig
> >>=C2=A0 DEPENDS =3D "libdrm ti-ipc"
> >>-SRC_URI =3D "git://git.ti.com/git/omapzoom/libdce.git;protocol=3Dhtt=
ps;branch=3Dmaster"
> >>+SRC_URI =3D "\
> >>+    git://git.ti.com/git/omapzoom/libdce.git;protocol=3Dhttps;branch=
=3Dmaster
> >>\
> >>+=C2=A0=C2=A0=C2=A0 file://0001-linux-Fix-compile-errors.patch \
> >>+"
> >>=C2=A0 SRCREV =3D "ec14e1d5cea1ed3c3ea0e2b9cf1fd581acff93e3"
> >>--=20
> >>2.17.1
> >>
> >>
> >>
> >>

