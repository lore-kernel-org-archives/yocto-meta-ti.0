Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.26571.1594157096167533943
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 14:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=wrtkLIe/;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 067LOtgH043805
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jul 2020 16:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594157095;
	bh=dNQ4ZAR6g7+CQ3nr5fs5MpcJMIrmMmXvQ2yvVYgDCoo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=wrtkLIe/LwYNfbjloJ+gIQfJ9WLvisXbffKnb8IHKyiUw6zoOMzZoz4M7aozjZ5Jt
	 iyx/pwS/OOHKh7C93JeMcd/ldiorjjaYov6n8MdAdg6/G540kWKvd0wJyPVaBkMoCd
	 F/AC0neQO8Emw9BYLLKaUjScKEp4QUXjTlyvLSmM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 067LOtqS030147
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jul 2020 16:24:55 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 16:24:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 7 Jul 2020 16:24:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067LOs7Z104666;
	Tue, 7 Jul 2020 16:24:54 -0500
Date: Tue, 7 Jul 2020 17:24:54 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Murali Karicheri <m-karicheri2@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [meta-arago PATCH] iproute2: update recipe for prp and supervision vlan support
Message-ID: <20200707212454.GK22569@beryl>
References: <20200707170207.5473-1-m-karicheri2@ti.com>
 <20200707170741.GD22569@beryl>
 <161F895730ADC75F.6803@lists.yoctoproject.org>
 <bbe0f557-34ed-b142-6362-fd14ea3694bc@ti.com>
MIME-Version: 1.0
In-Reply-To: <bbe0f557-34ed-b142-6362-fd14ea3694bc@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 067LOtgH043805
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2020 at 01:45:00PM -0400, Murali Karicheri wrote:
>=20
>=20
> On 7/7/20 1:43 PM, Murali via lists.yoctoproject.org wrote:
> >Denys,
> >
> >What is the email id for meta-arago. I am subscribed to it, but my mail
> >bounced.
> >
> >I tried meta-arago@lists.yoctoproject.org
> >
> I think I got it. Is it meta-arago@arago-project.org ?

Correct.


> >Thanks
> >
> >Murali
> >
> >On 7/7/20 1:07 PM, Denys Dmytriyenko wrote:
> >>Wrong mailing list. Please send this to meta-arago list instead.
> >>
> >>
> >>On Tue, Jul 07, 2020 at 01:02:07PM -0400, Murali Karicheri wrote:
> >>>This recipe includes the patches required in iproute2 to add
> >>>PRP ip link support as well as allow use of VLAN for supervision
> >>>frames.
> >>>
> >>>Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> >>>---
> >>>=A0 ...upport-for-creating-PRP-device-simil.patch | 109 +++++++++++++=
+++++
> >>>=A0 ...dd-support-for-vlan-tagged-supervisi.patch | 108 +++++++++++++=
++++
> >>>=A0 .../iproute2/iproute2_5.5.0.bbappend=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=
=A0=A0 8 ++
> >>>=A0 3 files changed, 225 insertions(+)
> >>>=A0 create mode 100644 meta-arago-distro/recipes-connectivity/iproute=
2/iproute2/0013-iplink-hsr-add-support-for-creating-PRP-device-simil.patch
> >>>
> >>>=A0 create mode 100644 meta-arago-distro/recipes-connectivity/iproute=
2/iproute2/0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
> >>>
> >>>=A0 create mode 100644
> >>>meta-arago-distro/recipes-connectivity/iproute2/iproute2_5.5.0.bbappe=
nd
> >>>
> >>>diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2=
/0013-iplink-hsr-add-support-for-creating-PRP-device-simil.patch b/meta-ara=
go-distro/recipes-connectivity/iproute2/iproute2/0013-iplink-hsr-add-suppor=
t-for-creating-PRP-device-simil.patch
> >>>
> >>>new file mode 100644
> >>>index 000000000000..dfeaeb01b485
> >>>--- /dev/null
> >>>+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0013-i=
plink-hsr-add-support-for-creating-PRP-device-simil.patch
> >>>
> >>>@@ -0,0 +1,109 @@
> >>>+From e3aa94814e9467af5829a04c335a615c0082a362 Mon Sep 17 00:00:00 20=
01
> >>>+From: Murali Karicheri <m-karicheri2@ti.com>
> >>>+Date: Fri, 5 Jun 2020 11:02:05 -0400
> >>>+Subject: [PATCH 1/2] iplink: hsr: add support for creating PRP devic=
e
> >>>similar
> >>>+ to HSR
> >>>+
> >>>+This patch enhances the iplink command to add a proto parameters to
> >>>+create PRP device/interface similar to HSR. Both protocols are
> >>>+quite similar and requires a pair of Ethernet interfaces. So re-use
> >>>+the existing HSR iplink command to create PRP device/interface as
> >>>+well. Use proto parameter to differentiate the two protocols.
> >>>+
> >>>+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> >>>+---
> >>>+ include/uapi/linux/if_link.h | 12 +++++++++++-
> >>>+ ip/iplink_hsr.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 19 +++++++=
++++++++++--
> >>>+ 2 files changed, 28 insertions(+), 3 deletions(-)
> >>>+
> >>>+diff --git a/include/uapi/linux/if_link.h
> >>>b/include/uapi/linux/if_link.h
> >>>+index 1c49f436424d..de08704c5862 100644
> >>>+--- a/include/uapi/linux/if_link.h
> >>>++++ b/include/uapi/linux/if_link.h
> >>>+@@ -881,7 +881,14 @@ enum {
> >>>+ #define IFLA_IPOIB_MAX (__IFLA_IPOIB_MAX - 1)
> >>>+
> >>>+
> >>>+-/* HSR section */
> >>>++/* HSR/PRP section, both uses same interface */
> >>>++
> >>>++/* Different redundancy protocols for hsr device */
> >>>++enum {
> >>>++=A0=A0=A0 HSR_PROTOCOL_HSR,
> >>>++=A0=A0=A0 HSR_PROTOCOL_PRP,
> >>>++=A0=A0=A0 HSR_PROTOCOL_MAX,
> >>>++};
> >>>+
> >>>+ enum {
> >>>+=A0=A0=A0=A0 IFLA_HSR_UNSPEC,
> >>>+@@ -891,6 +898,9 @@ enum {
> >>>+=A0=A0=A0=A0 IFLA_HSR_SUPERVISION_ADDR,=A0=A0=A0 /* Supervision fram=
e multicast
> >>>addr */
> >>>+=A0=A0=A0=A0 IFLA_HSR_SEQ_NR,
> >>>+=A0=A0=A0=A0 IFLA_HSR_VERSION,=A0=A0=A0=A0=A0=A0=A0 /* HSR version *=
/
> >>>++=A0=A0=A0 IFLA_HSR_PROTOCOL,=A0=A0=A0=A0=A0=A0=A0 /* Indicate diffe=
rent protocol than
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * HSR.=
 For example PRP.
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
> >>>+=A0=A0=A0=A0 __IFLA_HSR_MAX,
> >>>+ };
> >>>+
> >>>+diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
> >>>+index 7d9167d4e6a3..6ea138a23cbc 100644
> >>>+--- a/ip/iplink_hsr.c
> >>>++++ b/ip/iplink_hsr.c
> >>>+@@ -25,7 +25,7 @@ static void print_usage(FILE *f)
> >>>+ {
> >>>+=A0=A0=A0=A0 fprintf(f,
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 "Usage:\tip link add name NAME type hsr sla=
ve1 SLAVE1-IF
> >>>slave2 SLAVE2-IF\n"
> >>>+-=A0=A0=A0=A0=A0=A0=A0 "\t[ supervision ADDR-BYTE ] [version VERSION=
]\n"
> >>>++=A0=A0=A0=A0=A0=A0=A0 "\t[ supervision ADDR-BYTE ] [version VERSION=
] [proto
> >>>PROTOCOL]\n"
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 "\n"
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 "NAME\n"
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0 name of new hsr device (e.g. hsr=
0)\n"
> >>>+@@ -35,7 +35,9 @@ static void print_usage(FILE *f)
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0 0-255; the last byte of the mult=
icast address used for
> >>>HSR supervision\n"
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0 frames (default =3D 0)\n"
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 "VERSION\n"
> >>>+-=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0 0,1; the protocol version to be us=
ed. (default =3D 0)\n");
> >>>++=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0 0,1; the protocol version to be us=
ed. (default =3D 0)\n"
> >>>++=A0=A0=A0=A0=A0=A0=A0 "PROTOCOL\n"
> >>>++=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0 0 - HSR, 1 - PRP. (default =3D 0 -=
 HSR)\n");
> >>>+ }
> >>>+
> >>>+ static void usage(void)
> >>>+@@ -49,6 +51,7 @@ static int hsr_parse_opt(struct link_util *lu, int
> >>>argc, char **argv,
> >>>+=A0=A0=A0=A0 int ifindex;
> >>>+=A0=A0=A0=A0 unsigned char multicast_spec;
> >>>+=A0=A0=A0=A0 unsigned char protocol_version;
> >>>++=A0=A0=A0 unsigned char protocol =3D HSR_PROTOCOL_HSR;
> >>>+
> >>>+=A0=A0=A0=A0 while (argc > 0) {
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 if (matches(*argv, "supervision") =3D=3D 0)=
 {
> >>>+@@ -64,6 +67,13 @@ static int hsr_parse_opt(struct link_util *lu, in=
t
> >>>argc, char **argv,
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 invarg("version is =
invalid", *argv);
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 addattr_l(n, 1024, IFLA_HSR_VER=
SION,
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &protocol_ver=
sion, 1);
> >>>++=A0=A0=A0=A0=A0=A0=A0 } else if (matches(*argv, "proto") =3D=3D 0) =
{
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 NEXT_ARG();
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!(get_u8(&protocol, *argv, 0)=
 =3D=3D HSR_PROTOCOL_HSR ||
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 get_u8(&protoco=
l, *argv, 0) =3D=3D HSR_PROTOCOL_PRP))
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 invarg("protocol is i=
nvalid", *argv);
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 addattr_l(n, 1024, IFLA_HSR_PROTO=
COL,
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &protocol, 1);
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 } else if (matches(*argv, "slave1") =3D=3D =
0) {
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 NEXT_ARG();
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ifindex =3D ll_name_to_index(*a=
rgv);
> >>>+@@ -140,6 +150,11 @@ static void hsr_print_opt(struct link_util *lu,
> >>>FILE *f, struct rtattr *tb[])
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 RTA_=
PAYLOAD(tb[IFLA_HSR_SUPERVISION_ADDR]),
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARPH=
RD_VOID,
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 b1, =
sizeof(b1)));
> >>>++=A0=A0=A0 if (tb[IFLA_HSR_PROTOCOL])
> >>>++=A0=A0=A0=A0=A0=A0=A0 print_int(PRINT_ANY,
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "proto",
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "proto %d ",
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 rta_getattr_u8(tb[IFLA_HSR_=
PROTOCOL]));
> >>>+ }
> >>>+
> >>>+ static void hsr_print_help(struct link_util *lu, int argc, char
> >>>**argv,
> >>>+--
> >>>+2.17.1
> >>>+
> >>>diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2=
/0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch b/meta-ara=
go-distro/recipes-connectivity/iproute2/iproute2/0014-iplink-hsr-prp-add-su=
pport-for-vlan-tagged-supervisi.patch
> >>>
> >>>new file mode 100644
> >>>index 000000000000..fa0eecccdf59
> >>>--- /dev/null
> >>>+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0014-i=
plink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch
> >>>
> >>>@@ -0,0 +1,108 @@
> >>>+From 6e48ed61da3b03da415a87bfbd3651fde8742647 Mon Sep 17 00:00:00 20=
01
> >>>+From: Murali Karicheri <m-karicheri2@ti.com>
> >>>+Date: Fri, 5 Jun 2020 12:07:43 -0400
> >>>+Subject: [PATCH 2/2] iplink: hsr/prp: add support for vlan tagged
> >>>supervision
> >>>+ frames
> >>>+
> >>>+This patch adds support to configure vlan tag information
> >>>+(vid, pcp and dei) at the hsr/prp lre device. This tag values
> >>>+will be used by the lre device to generate a VLAN tagged
> >>>+Supervision frames. This is done by adding 3 additional attributes
> >>>+to the hsr/prp link type and passing this to Linux HSR/PRP
> >>>+device through the ip link command.
> >>>+
> >>>+Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> >>>+---
> >>>+ include/uapi/linux/if_link.h |=A0 3 +++
> >>>+ ip/iplink_hsr.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 40 +++++++=
++++++++++++++++++++++++++++-
> >>>+ 2 files changed, 42 insertions(+), 1 deletion(-)
> >>>+
> >>>+diff --git a/include/uapi/linux/if_link.h
> >>>b/include/uapi/linux/if_link.h
> >>>+index de08704c5862..94a381769e5a 100644
> >>>+--- a/include/uapi/linux/if_link.h
> >>>++++ b/include/uapi/linux/if_link.h
> >>>+@@ -901,6 +901,9 @@ enum {
> >>>+=A0=A0=A0=A0 IFLA_HSR_PROTOCOL,=A0=A0=A0=A0=A0=A0=A0 /* Indicate dif=
ferent protocol than
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * HS=
R. For example PRP.
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
> >>>++=A0=A0=A0 IFLA_HSR_SV_VID,=A0=A0=A0=A0=A0=A0=A0 /* Supervision fram=
es VLAN ID */
> >>>++=A0=A0=A0 IFLA_HSR_SV_DEI,=A0=A0=A0=A0=A0=A0=A0 /* Supervision fram=
es VLAN DEI */
> >>>++=A0=A0=A0 IFLA_HSR_SV_PCP,=A0=A0=A0=A0=A0=A0=A0 /* Supervision fram=
es VLAN PCP */
> >>>+=A0=A0=A0=A0 __IFLA_HSR_MAX,
> >>>+ };
> >>>+
> >>>+diff --git a/ip/iplink_hsr.c b/ip/iplink_hsr.c
> >>>+index 6ea138a23cbc..f38c752c0065 100644
> >>>+--- a/ip/iplink_hsr.c
> >>>++++ b/ip/iplink_hsr.c
> >>>+@@ -26,6 +26,7 @@ static void print_usage(FILE *f)
> >>>+=A0=A0=A0=A0 fprintf(f,
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 "Usage:\tip link add name NAME type hsr sla=
ve1 SLAVE1-IF
> >>>slave2 SLAVE2-IF\n"
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 "\t[ supervision ADDR-BYTE ] [version VERSI=
ON] [proto
> >>>PROTOCOL]\n"
> >>>++=A0=A0=A0=A0=A0=A0=A0 "\t[ sv_vid SV-VID ] [ sv_pcp SV-PCP ] [ sv_d=
ei SV-DEI ]\n"
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 "\n"
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 "NAME\n"
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0 name of new hsr device (e.g. hsr=
0)\n"
> >>>+@@ -37,7 +38,15 @@ static void print_usage(FILE *f)
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 "VERSION\n"
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0 0,1; the protocol version to be =
used. (default =3D 0)\n"
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 "PROTOCOL\n"
> >>>+-=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0 0 - HSR, 1 - PRP. (default =3D 0 -=
 HSR)\n");
> >>>++=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0 0 - HSR, 1 - PRP. (default =3D 0 -=
 HSR)\n"
> >>>++=A0=A0=A0=A0=A0=A0=A0 "SV-VID\n"
> >>>++=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0=A0=A0 0-4094; VLAN ID to be used i=
n the VLAN tag of SV
> >>>frames (default 0)\n"
> >>>++=A0=A0=A0=A0=A0=A0=A0 "SV-PCP\n"
> >>>++=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0=A0=A0 0-7; PCP value to be used in=
 the VLAN tag of SV
> >>>frames (default 0)\n"
> >>>++=A0=A0=A0=A0=A0=A0=A0 "SV-DEI\n"
> >>>++=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0=A0=A0 0-1;=A0 DEI value to be used=
 in the VLAN tag of SV
> >>>frames (default 0)\n"
> >>>++=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0=A0=A0 Use VLAN tag if one of sv_vi=
d, sv_pcp or sv_dei is
> >>>specified. Default value\n"
> >>>++=A0=A0=A0=A0=A0=A0=A0 "=A0=A0=A0=A0=A0 used for unspecified ones\n"=
);
> >>>+ }
> >>>+
> >>>+ static void usage(void)
> >>>+@@ -52,6 +61,9 @@ static int hsr_parse_opt(struct link_util *lu, int
> >>>argc, char **argv,
> >>>+=A0=A0=A0=A0 unsigned char multicast_spec;
> >>>+=A0=A0=A0=A0 unsigned char protocol_version;
> >>>+=A0=A0=A0=A0 unsigned char protocol =3D HSR_PROTOCOL_HSR;
> >>>++=A0=A0=A0 unsigned short sv_vid;
> >>>++=A0=A0=A0 unsigned char sv_dei;
> >>>++=A0=A0=A0 unsigned char sv_pcp;
> >>>+
> >>>+=A0=A0=A0=A0 while (argc > 0) {
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 if (matches(*argv, "supervision") =3D=3D 0)=
 {
> >>>+@@ -86,6 +98,32 @@ static int hsr_parse_opt(struct link_util *lu, in=
t
> >>>argc, char **argv,
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ifindex =3D=3D 0)
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 invarg("No such int=
erface", *argv);
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 addattr_l(n, 1024, IFLA_HSR_SLA=
VE2, &ifindex, 4);
> >>>++=A0=A0=A0=A0=A0=A0=A0 } else if (matches(*argv, "sv_vid") =3D=3D 0)=
 {
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 NEXT_ARG();
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (get_u16(&sv_vid, *argv, 0))
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 invarg("SV-VID is inv=
alid", *argv);
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* exclude reserved 4095 */
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (sv_vid >=3D 4095)
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 invarg("SV-VID is inv=
alid", *argv);
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 addattr_l(n, 1024, IFLA_HSR_SV_VI=
D,
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &sv_vid, sizeof=
(sv_vid));
> >>>++=A0=A0=A0=A0=A0=A0=A0 } else if (matches(*argv, "sv_pcp") =3D=3D 0)=
 {
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 NEXT_ARG();
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (get_u8(&sv_pcp, *argv, 0))
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 invarg("SV-PCP is inv=
alid", *argv);
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (sv_pcp > 7)
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 invarg("SV-PCP is inv=
alid", *argv);
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 addattr_l(n, 1024, IFLA_HSR_SV_PC=
P,
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &sv_pcp, sizeof=
(sv_pcp));
> >>>++=A0=A0=A0=A0=A0=A0=A0 } else if (matches(*argv, "sv_dei") =3D=3D 0)=
 {
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 NEXT_ARG();
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (get_u8(&sv_dei, *argv, 0))
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 invarg("SV-DEI is inv=
alid", *argv);
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (sv_dei > 1)
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 invarg("SV-DEI is inv=
alid", *argv);
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 addattr_l(n, 1024, IFLA_HSR_SV_DE=
I,
> >>>++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &sv_dei, sizeof=
(sv_dei));
> >>>++
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0 } else if (matches(*argv, "help") =3D=3D 0)=
 {
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 usage();
> >>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -1;
> >>>+--
> >>>+2.17.1
> >>>+
> >>>diff --git
> >>>a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_5.5.0.bbap=
pend
> >>>b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_5.5.0.bbap=
pend
> >>>
> >>>new file mode 100644
> >>>index 000000000000..d6effcd7ca81
> >>>--- /dev/null
> >>>+++
> >>>b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_5.5.0.bbap=
pend
> >>>
> >>>@@ -0,0 +1,8 @@
> >>>+PR_append =3D ".arago6"
> >>>+
> >>>+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> >>>+
> >>>+SRC_URI_append =3D " \
> >>>+
> >>>file://0013-iplink-hsr-add-support-for-creating-PRP-device-simil.patc=
h
> >>>\
> >>>+
> >>>file://0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patc=
h
> >>>\
> >>>+"
> >>>--=20
> >>>2.17.1
> >>>
> >
> >
> >
> >
>=20
> --=20
> Murali Karicheri
> Texas Instruments
