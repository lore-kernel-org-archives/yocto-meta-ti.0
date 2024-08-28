Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0F0C636DC
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 16:06:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.203.1724861183225101176
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Aug 2024 09:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3FDA840CC1;
	Wed, 28 Aug 2024 16:06:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4Fa8gWWSKnr; Wed, 28 Aug 2024 16:06:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DF60440C3E;
	Wed, 28 Aug 2024 16:06:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 37B68164063; Wed, 28 Aug 2024 12:06:18 -0400 (EDT)
Date: Wed, 28 Aug 2024 12:06:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] trusted-firmware-a:
 Update to v2.11 release tag
Message-ID: <20240828160618.GD17572@denix.org>
References: <20240816185307.15808-1-reatmon@ti.com>
 <20240827193849.GC17572@denix.org>
 <17EFB549A3D1C7CA.5649@lists.yoctoproject.org>
 <5fb77bdf-2bd2-4373-9aac-1aac5ac2e60e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <5fb77bdf-2bd2-4373-9aac-1aac5ac2e60e@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 28 Aug 2024 16:06:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17956

On Tue, Aug 27, 2024 at 05:14:07PM -0500, Ryan Eatmon wrote:
>=20
>=20
> On 8/27/2024 5:08 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >
> >
> >On 8/27/2024 2:38 PM, Denys Dmytriyenko wrote:
> >>On Fri, Aug 16, 2024 at 01:53:07PM -0500, Ryan Eatmon via
> >>lists.yoctoproject.org wrote:
> >>>From: Kamlesh Gurudasani <kamlesh@ti.com>
> >>>
> >>>Update to latest release tag, i.e. v2.11.
> >>>
> >>>Also update the LIC_FILES_CHKSUM since the license file changed sinc=
e
> >>>the last SRCREV change.
> >>
> >>Changed in what way? It is recommended to briefly describe
> >>license changes in
> >>the commit log - it forces one to review the changes to ensure
> >>there are no
> >>license incompatibilities or even in the worst case complete
> >>re-licensing of
> >>the product.
> >
> >The license file for that project is a little goofy.=A0 It has a big
> >overall license, but then breaks out some specific features/blocks
> >of code and lists additional license for those sections.=A0 And
> >that's what they changed.=A0 They added some new items to that list.
> >
> >I thought about pushing back on the project and using the
> >begins/ends concept to selectively extract the main license, but
> >then I thought about it realized that was not a good idea.
> >
> >I'm open to suggestions about how to word a commit to handle this
> >kind of thing in the future.
> >
> >Here is the license file:
> >
> >https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-=
a/+/refs/tags/v2.11/docs/license.rst
> >
> >And here is the change that impacts this patch:
> >
> >https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-=
a/+/584052c7f80b406666b9597447eeccef4d6deca4%5E%21/docs/license.rst
>=20
> The license file above lists these licenses:
>=20
> BSD-3-Clause
>   plus
> _FreeBSD: http://www.freebsd.org
> _Linux MIT license: https://raw.githubusercontent.com/torvalds/linux/ma=
ster/LICENSES/preferred/MIT
> _SCC: http://www.simple-cc.org/
> _Open Profile for DICE: https://pigweed.googlesource.com/open-dice/
> _Apache License 2.0: https://www.apache.org/licenses/LICENSE-2.0.txt
>=20
>=20
>=20
> But the recipe[1][2] only lists this:
>=20
> LICENSE =3D "BSD-3-Clause & MIT"
>=20
> Does that mean the base recipe is also "not compliant" and should be
> updated?
>=20
> [1] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-bsp/tru=
sted-firmware-a/trusted-firmware-a.inc
> [2] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-bsp/tru=
sted-firmware-a/trusted-firmware-a_2.11.0.bb
>=20
>=20
> >
> >>In this case the changes were not too bad, but apparently the
> >>list of licenses
> >>did change - see this discussion:
> >>
> >>https://lists.yoctoproject.org/g/meta-arm/topic/106488067#msg6004

Have you looked at our upstream meta-arm discussion I linked here?



> >>>Commit:
> >>>https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/f2735ebccf=
5173f74c0458736ec526276106097e
> >>>
> >>>Tag:
> >>>https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/refs/tags/=
v2.11
> >>>
> >>>Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> >>>Tested-by: Manorit Chawdhry <m-chawdhry@ti.com>
> >>>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>>---
> >>>=A0 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc | 5=
 +++--
> >>>=A0 1 file changed, 3 insertions(+), 2 deletions(-)
> >>>
> >>>diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firm=
ware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a-ti.inc
> >>>index 291259c0..157bdbc5 100644
> >>>--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc
> >>>+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc
> >>>@@ -1,5 +1,6 @@
> >>>-PV:k3 =3D "2.10+git"
> >>>-SRCREV_tfa:k3 =3D "00f1ec6b8740ccd403e641131e294aabacf2a48b"
> >>>+PV:k3 =3D "2.11+git"
> >>>+SRCREV_tfa:k3 =3D "f2735ebccf5173f74c0458736ec526276106097e"
> >>>+LIC_FILES_CHKSUM:k3 =3D
> >>>"file://docs/license.rst;md5=3Db5fbfdeb6855162dded31fadcd5d4dc5"
> >>>=A0 SRC_URI:k3 =3D "git://git.trustedfirmware.org/TF-A/trusted-firmw=
are-a.git;protocol=3Dhttps;name=3Dtfa;branch=3Dmaster"
> >>>=A0 COMPATIBLE_MACHINE:k3 =3D "k3"
> >>>=A0 TFA_BUILD_TARGET:k3 =3D "all"
> >>>--=20
> >>>2.17.1

