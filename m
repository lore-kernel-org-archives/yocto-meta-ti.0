Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49E21E01493
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2013 09:06:25 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2SG6MuZ019474;
	Thu, 28 Mar 2013 11:06:22 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2SG6M6r021883;
	Thu, 28 Mar 2013 11:06:22 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 28 Mar 2013 11:06:22 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Ian M. Wisbon" <ian.wisbon@timesys.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] OMAP5: Booting build output
Thread-Index: AQHOK8xUwOzseCB+eESalC9uG9viSpi7RADA
Date: Thu, 28 Mar 2013 16:06:21 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594ACEFA@DLEE11.ent.ti.com>
References: <20130328115247.029b68ae@duckworth>
In-Reply-To: <20130328115247.029b68ae@duckworth>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: OMAP5: Booting build output
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
X-List-Received-Date: Thu, 28 Mar 2013 16:06:25 -0000
X-Groupsio-MsgNum: 2485
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_7D46E86EC0A8354091174257B2FED101594ACEFADLEE11entticom_"

--_002_7D46E86EC0A8354091174257B2FED101594ACEFADLEE11entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Ian,

We are updating the base images to boot this more easily.  Until then you c=
an boot from an SD card that has a FAT boot partition and the rootfs in an =
EXT partition.

You need to pass one of the device tree files from the deploy directory as =
well.  If you use the attached boot.scr (It is called boot.txt so please re=
name it) file in your FAT partition you can just rename the omap5-panda.dtb=
 file to omap5-evm.dtb in the FAT partition and the boot should work on a u=
EVM.  These names are changing in the next kernel to omap5-uevm.dtb by defa=
ult.

Sincerely,
Chase Maupin


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Ian M. Wisbon
> Sent: Thursday, March 28, 2013 10:53 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] OMAP5: Booting build output
>=20
> Hello,
>=20
> I've completed a build for the OMAP5 uEVM using the meta-ti
> layer, and
> was wondering whether there is any documentation for booting the
> resulting output? Particular DIP switch settings, viable means of
> booting - SD/USB/eMMC, particular formatting operations for SD,
> etc.
>=20
> I am familiar with the documentation on OMAPpedia wrt OMAPBOOT,
> but I'm
> not looking to boot/flash Android - and as you're building U-boot
> MLO/img this doesn't seem applicable, but correct me if I am
> wrong. I
> understand that the documentation may be limited/restricted at
> this
> time, so if necessary I will contact the appropriate sources, or
> wait
> until such time as documentation is released.
>=20
> Regards,
>=20
> --
> ---
> Ian Wisbon
> Support Manager
> Timesys Corporation
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

--_002_7D46E86EC0A8354091174257B2FED101594ACEFADLEE11entticom_
Content-Type: text/plain; name="boot.txt"
Content-Description: boot.txt
Content-Disposition: attachment; filename="boot.txt"; size=416;
	creation-date="Fri, 22 Mar 2013 16:04:21 GMT";
	modification-date="Fri, 22 Mar 2013 16:04:21 GMT"
Content-Transfer-Encoding: base64

JwUZVpVgunJRCVaMAAABYAAAAAAAAAAAu6kyogUCBgBib290LnNjcgAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAVgAAAAAc2V0ZW52IGZkdF9oaWdoIDB4ZmZmZmZmZmYKZmR0IGFkZHIgMHg4MEY4
MDAwMAptbWMgcmVzY2FuCgpmYXRsb2FkIG1tYyAwOjEgMHg4MDMwMDAwMCB1SW1hZ2UKZmF0bG9h
ZCBtbWMgMDoxICR7ZmR0YWRkcn0gb21hcDUtZXZtLmR0YgoKc2V0ZW52IG1tY2FyZ3Mgc2V0ZW52
IGJvb3RhcmdzIGNvbnNvbGU9dHR5TzIsMTE1MjAwbjggbm9pbml0cmQgaW5pdD0vc2Jpbi9pbml0
IHJvb3Q9L2Rldi9tbWNibGswcDIgcncgcm9vdGZzdHlwZT1leHQzIHJvb3R3YWl0IGVhcmx5cHJp
bnRrCgpwcmludGVudgpydW4gbW1jYXJncwojYm9vdG0gMHg4MDMwMDAwMApib290bSAweDgwMzAw
MDAwIC0gJHtmZHRhZGRyfQo=

--_002_7D46E86EC0A8354091174257B2FED101594ACEFADLEE11entticom_--
