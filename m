Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FFA9E01438
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 05:23:09 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8ECN8cK010678
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 07:23:08 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8ECN8T0027843
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 07:23:08 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Fri, 14 Sep 2012 07:23:08 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Make meta-ti comply with Yocto Project BSP requirements
Thread-Index: AQHNklAxurNv0O5Nx0KPFMYk1gT+55eJwiUw
Date: Fri, 14 Sep 2012 12:23:07 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101591F3D36@DLEE12.ent.ti.com>
References: <20120914080805.GD26968@edge>
In-Reply-To: <20120914080805.GD26968@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: Make meta-ti comply with Yocto Project BSP requirements
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
X-List-Received-Date: Fri, 14 Sep 2012 12:23:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> Sent: Friday, September 14, 2012 3:08 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] Make meta-ti comply with Yocto Project BSP
> requirements
>=20
> All,
>=20
> One of the requirements for a BSP layer to be officially Yocto
> Project
> compliant or compatible is to avoid mixing hardware suport with
> policy
> configuration. Here is the corresponding commit from Richard to
> split
> meta-yocto into distro and BSP pieces, as separate layers:
>=20
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-
> yocto/commit/?id=3Deac90e27a032ea23d9a4f35c7eef8b1940c80e22
>=20
> In meta-ti we have several levels of severity in violation of
> this requirement:
>=20
> 1. Depending (i.e. DEPENDS/RDEPENDS) on packages from another
> "application"
> layer, such as meta-oe, meta-systemd, etc. It can be argued that
> such
> dependency is not on "policy configuration", plus it does not
> break parsing,
> unless problematic recipes need to be built, thus mark it as
> lower priority
> for now.
>=20
> 2. Depending (again, DEPENDS/RDEPENDS) on packages from a
> "distribution"
> layer, such as meta-angstrom (or potentially, meta-yocto or meta-
> arago). This
> does not break parsing, but violates the above requirement, by
> depending on a
> specific "policy configuration" layer. Medium priority.
>=20
> 3. Inheriting (i.e. inherit systemd) classes from another layer,
> such as
> meta-systemd. This behavior breaks parsing and requires BBMASK-
> ing those
> problematic recipes. Although, it requires an "application" layer
> and not a
> "distribution" one, it's quite bad nonetheless, as it breaks
> parsing. High
> priority.
>=20
> 4. Including (i.e. require/include) a file from a "distro" layer
> - again,
> depending on a specific "policy configurtion" layer is in
> violation of the
> requirement. And using "require" will even break parsing, when
> such layer is
> not referenced in the BBLAYERS stack. There are also problems
> with "include"
> as well, when variables like LICENSE are expected to be set by
> distro layer.
> High priority.
>=20
>=20
> I'd like to start addressing these issues in the reverse order,
> according to
> the priority. There is a RFC with 2 possible quick/temporary
> workarounds to
> "fix" #4. Please provide feedback for those.
>=20
> The longer-term proper solution would be to split out offending
> recipes into a
> separate layer. Nobody wants to simply remove them - we want to
> preserve them,
> just put them in right place.
>=20
> I can create a sub-layer inside meta-ti and move the recipes
> there - can send
> a patch/proposal right away. Or we can agree to host them in an
> outside layer -
> once they are copied there, I can remove them from meta-ti. Let's
> agree on
> something.

Denys,

I think having a sub-layer for these recipes would be a good idea.  The pie=
ces in that layer would be the ones that need to find a new home.  So it wo=
uld act kind of like a buffer layer for pieces in transition rather than ha=
ving it scattered throughout the meta-ti layer.

>=20
> Yes, the topic of moving those recipes into a separate layer was
> discussed
> here ad nauseam lately, but this email is meant to lay down the
> official
> reasons for such move and follow through. Thank you for your
> cooperation.
>=20
> --
> Denys
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

