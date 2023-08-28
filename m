Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EDFC83F15
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 21:49:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4118.1693259356464522037
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 14:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7D4F340CB3;
	Mon, 28 Aug 2023 21:49:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvoAXeqhPNZH; Mon, 28 Aug 2023 21:49:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4E4D340C82;
	Mon, 28 Aug 2023 21:49:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 56A2E163C94; Mon, 28 Aug 2023 17:49:11 -0400 (EDT)
Date: Mon, 28 Aug 2023 17:49:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] ti-img-rogue-umlibs: Add DEPENDS on
 BASE_DEFAULT_DEPS
Message-ID: <20230828214911.GR3359@denix.org>
References: <20230828202211.22475-1-reatmon@ti.com>
 <20230828203915.GQ3359@denix.org>
 <177FA6F1CCEC185E.29216@lists.yoctoproject.org>
 <5af0c60b-c546-7741-bc47-fe6bcec5fc93@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <5af0c60b-c546-7741-bc47-fe6bcec5fc93@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Aug 2023 21:49:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16900

On Mon, Aug 28, 2023 at 04:13:48PM -0500, Ryan Eatmon wrote:
>=20
>=20
> On 8/28/2023 3:45 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >
> >
> >On 8/28/2023 3:39 PM, Denys Dmytriyenko wrote:
> >>On Mon, Aug 28, 2023 at 03:22:11PM -0500, Ryan Eatmon via
> >>lists.yoctoproject.org wrote:
> >>>A recent change to oe-core [1], has caused a pile of QA errors durin=
g
> >>>packaging for this binary package.=A0 The effect of the change in oe=
-core
> >>>was to remove the dependency on the compiler and other compiler adja=
cent
> >>>libraries.=A0 But the binary packages need some of the compiler tool=
s as
> >>>part of the packaging flow (ie. objdump).
> >>>
> >>>Until the above gets reverted, this patch will fix the issue and can=
 be
> >>>reverted itself once oe-core is fixed.
> >>>
> >>>[1] https://git.openembedded.org/openembedded-core/commit/?h=3Dmaste=
r&id=3Dd1d09bd4d7be88f0e341d5fccbfbefeb98d4b727
> >>
> >>Why not simply reset INHIBIT_DEFAULT_DEPS in the recipe?
> >
> >Good question.=A0 Let me try that.=A0 It should work, but I want to be=
 sure.
>=20
> huh...  It didn't work...
>=20
>=20
> inherit bin_package
>=20
> INHIBIT_DEFAULT_DEPS =3D "0"
>=20
>=20
> That gave the same build errors....
>=20
>=20
> Here is code that is using the variable:
>=20
> def get_base_dep(d):
>     if d.getVar('INHIBIT_DEFAULT_DEPS', False):
>         return ""
>     return "${BASE_DEFAULT_DEPS}"

Ah, right, it doesn't check for the value, just the fact that the variabl=
e is=20
defined. Could try unset or d.delVar()... But, revert in OE-Core does mak=
e=20
perfect sense. Today is a holiday in the UK, so Richard is out until tomo=
rrow.


> >>>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>>---
> >>>=A0 .../powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 | 2 ++
> >>>=A0 1 file changed, 2 insertions(+)
> >>>
> >>>diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogu=
e-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti=
-img-rogue-umlibs_23.1.6404501.bb
> >>>index f748bd0f..73de93e5 100644
> >>>--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlib=
s_23.1.6404501.bb
> >>>+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlib=
s_23.1.6404501.bb
> >>>@@ -37,6 +37,8 @@ PACKAGECONFIG[opengl] =3D ",,,,${GLES_PACKAGES}"
> >>>=A0 PACKAGECONFIG[vulkan] =3D ",,,,${VULKAN_PACKAGES}"
> >>>=A0 PACKAGECONFIG[opencl] =3D ",,,,${OPENCL_PACKAGES}"
> >>>+DEPENDS:prepend =3D "${BASE_DEFAULT_DEPS} "
> >>>+
> >>>=A0 def get_file_list(package_list_var, d):
> >>>=A0=A0=A0=A0=A0 file_list =3D []
> >>>=A0=A0=A0=A0=A0 package_list =3D d.getVar(package_list_var)
> >>>--=20
> >>>2.17.1

