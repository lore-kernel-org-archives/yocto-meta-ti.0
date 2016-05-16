Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20A46E00BF8; Mon, 16 May 2016 15:37:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C600E00B1E
	for <meta-ti@yoctoproject.org>; Mon, 16 May 2016 15:37:02 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4GMb1YO025865
	for <meta-ti@yoctoproject.org>; Mon, 16 May 2016 17:37:01 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4GMb10o010131
	for <meta-ti@yoctoproject.org>; Mon, 16 May 2016 17:37:01 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Mon, 16 May 2016 17:37:00 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH] linux-ti-staging: Add new device tree target
	am572x-idk-pru-excl-uio.dtb
Thread-Index: AQHRryCDzxxmVQFaz0GOuNHaZ5O0JZ+7PKeA//+tuICAASSbAP//3dOwgABZLgD//8WDoAALPisAAAeb8HA=
Date: Mon, 16 May 2016 22:37:00 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490583BB806@DLEE11.ent.ti.com>
References: <1463368232-52539-1-git-send-email-sam.nelson@ti.com>
	<20160516033217.GF16188@edge>
	<4F9216F96E5DF9428610502835A9F490583B8603@DLEE11.ent.ti.com>
	<20160516160504.GI16188@edge>
	<4F9216F96E5DF9428610502835A9F490583BB431@DLEE11.ent.ti.com>
	<20160516192156.GL16188@edge>
	<4F9216F96E5DF9428610502835A9F490583BB6E1@DLEE11.ent.ti.com>
	<20160516211430.GM16188@edge>
In-Reply-To: <20160516211430.GM16188@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-ti-staging: Add new device tree target am572x-idk-pru-excl-uio.dtb
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
X-List-Received-Date: Mon, 16 May 2016 22:37:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, May 16, 2016 5:15 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] linux-ti-staging: Add new device tree targ=
et
> am572x-idk-pru-excl-uio.dtb
>=20
> On Mon, May 16, 2016 at 05:00:44PM -0400, Nelson, Sam wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Monday, May 16, 2016 3:22 PM
> > > To: Nelson, Sam
> > > Cc: meta-ti@yoctoproject.org
> > > Subject: Re: [meta-ti] [PATCH] linux-ti-staging: Add new device tree
> > > target am572x-idk-pru-excl-uio.dtb
> > >
> > > On Mon, May 16, 2016 at 03:11:30PM -0400, Nelson, Sam wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Dmytriyenko, Denys
> > > > > Sent: Monday, May 16, 2016 12:05 PM
> > > > > To: Nelson, Sam
> > > > > Cc: meta-ti@yoctoproject.org
> > > > > Subject: Re: [meta-ti] [PATCH] linux-ti-staging: Add new device
> > > > > tree target am572x-idk-pru-excl-uio.dtb
> > > > >
> > > > > On Sun, May 15, 2016 at 11:38:47PM -0400, Nelson, Sam wrote:
> > > > > >
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Dmytriyenko, Denys
> > > > > > > Sent: Sunday, May 15, 2016 11:32 PM
> > > > > > > To: Nelson, Sam
> > > > > > > Cc: meta-ti@yoctoproject.org
> > > > > > > Subject: Re: [meta-ti] [PATCH] linux-ti-staging: Add new
> > > > > > > device tree target am572x-idk-pru-excl-uio.dtb
> > > > > > >
> > > > > > > See below.
> > > > > > >
> > > > > > >
> > > > > > > On Sun, May 15, 2016 at 11:10:32PM -0400, Sam Nelson wrote:
> > > > > > > > This new device tree file is to support pruss with uio base=
d
> drivers.
> > > > > > > > Adds uio entries for pruss susbsystem.
> > > > > > > >
> > > > > > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > > > > > ---
> > > > > > > >  .../linux/files/dra7xx/am572x-pru-uio.dtsi         | 191
> > > > > > > +++++++++++++++++++++
> > > > > > > >  recipes-kernel/linux/linux-ti-staging_4.4.bb       |   2 +=
-
> > > > > > > >  recipes-kernel/linux/ti-uio.inc                    |  12 +=
+
> > > > > > > >  3 files changed, 204 insertions(+), 1 deletion(-)  create
> > > > > > > > mode
> > > > > > > > 100644
> > > > > > > > recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi
> > > > > > > >
> > > > > > > > diff --git
> > > > > > > > a/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi
> > > > > > > > b/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dtsi
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000..001cbec
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/recipes-kernel/linux/files/dra7xx/am572x-pru-uio.dts
> > > > > > > > +++ i
> > > > > > > > @@ -0,0 +1,191 @@
> > > > > > > > +/ {
> > > > > > > > +	ocp {
> > > > > > > > +		pruss2_eth {
> > > > > > > > +		status =3D "disabled";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss1_mem: uio_pruss1_mem {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			ti,hwmods =3D "pruss1";
> > > > > > > > +			mem =3D <0x4b200000 0x2000>,
> > > > > > > > +			      <0x4b202000 0x2000>,
> > > > > > > > +			      <0x4b210000 0x8000>,
> > > > > > > > +			      <0x4b220000 0x2000>,
> > > > > > > > +			      <0x4b226000 0x2000>,
> > > > > > > > +			      <0x4b22e000 0x31c>,
> > > > > > > > +			      <0x4b232000 0x58>;
> > > > > > > > +			mem-names =3D "dram0", "dram1", "shrdram2",
> > > "intc",
> > > > > > > "cfg",
> > > > > > > > +				    "iep", "mii_rt";
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss1_evt0: uio_pruss1_evt0 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 186
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss1_evt1: uio_pruss1_evt1 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 187
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss1_evt2: uio_pruss1_evt2 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 188
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss1_evt3: uio_pruss1_evt3 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 189
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss1_evt4: uio_pruss1_evt4 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 190
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss1_evt5: uio_pruss1_evt5 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 191
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss1_evt6: uio_pruss1_evt6 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 192
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss1_evt7: uio_pruss1_evt7 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 193
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +
> > > > > > > > +		uio_pruss1_0_mem: uio_pruss1_0_mem {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			mem =3D <0x4b234000 0x3000>,
> > > > > > > > +			      <0x4b222000 0x400>,
> > > > > > > > +			      <0x4b222400 0x100>;
> > > > > > > > +			mem-names =3D "iram", "control", "debug";
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +
> > > > > > > > +		uio_pruss1_1_mem: uio_pruss1_1_mem {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			mem =3D <0x4b238000 0x3000>,
> > > > > > > > +			      <0x4b224000 0x400>,
> > > > > > > > +			      <0x4b224400 0x100>;
> > > > > > > > +			mem-names =3D "iram", "control", "debug";
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +
> > > > > > > > +		uio_pruss1_mdio: uio_pruss1_mdio {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			mem =3D <0x4b232400 0x90>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +
> > > > > > > > +		uio_pruss2_mem: uio_pruss2_mem {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			ti,hwmods =3D "pruss2";
> > > > > > > > +			mem =3D <0x4b280000 0x2000>,
> > > > > > > > +			      <0x4b282000 0x2000>,
> > > > > > > > +			      <0x4b290000 0x8000>,
> > > > > > > > +			      <0x4b2a0000 0x2000>,
> > > > > > > > +			      <0x4b2a6000 0x2000>,
> > > > > > > > +			      <0x4b2ae000 0x31c>,
> > > > > > > > +			      <0x4b2b2000 0x58>;
> > > > > > > > +			mem-names =3D "dram0", "dram1", "shrdram2",
> > > "intc",
> > > > > > > "cfg",
> > > > > > > > +				    "iep", "mii_rt";
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss2_evt0: uio_pruss2_evt0 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 196
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss2_evt1: uio_pruss2_evt1 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 197
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss2_evt2: uio_pruss2_evt2 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 198
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss2_evt3: uio_pruss2_evt3 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 199
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss2_evt4: uio_pruss2_evt4 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 200
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss2_evt5: uio_pruss2_evt5 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 201
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss2_evt6: uio_pruss2_evt6 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 202
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss2_evt7: uio_pruss2_evt7 {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			interrupts =3D <GIC_SPI 203
> > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +
> > > > > > > > +		uio_pruss2_0_mem: uio_pruss2_0_mem {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			mem =3D <0x4b2b4000 0x3000>,
> > > > > > > > +			      <0x4b2a2000 0x400>,
> > > > > > > > +			      <0x4b2a2400 0x100>;
> > > > > > > > +			mem-names =3D "iram", "control", "debug";
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss2_1_mem: uio_pruss2_1_mem {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			mem =3D <0x4b2b8000 0x3000>,
> > > > > > > > +			      <0x4b2a4000 0x400>,
> > > > > > > > +			      <0x4b2a4400 0x100>;
> > > > > > > > +			mem-names =3D "iram", "control", "debug";
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +		uio_pruss2_mdio: uio_pruss2_mdio {
> > > > > > > > +			compatible =3D "ti,uio-module-drv";
> > > > > > > > +			mem =3D <0x4b2b2400 0x90>;
> > > > > > > > +			mem-names =3D "mdio";
> > > > > > > > +			status =3D "okay";
> > > > > > > > +		};
> > > > > > > > +	};
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&pruss1 {
> > > > > > > > +	status =3D "disabled";
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&pru1_0 {
> > > > > > > > +	status =3D "disabled";
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&pru1_1 {
> > > > > > > > +	status =3D "disabled";
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&pruss2 {
> > > > > > > > +	status =3D "disabled";
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&pru2_0 {
> > > > > > > > +	status =3D "disabled";
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&pru2_1 {
> > > > > > > > +	status =3D "disabled";
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&pruss2_mdio {
> > > > > > > > +	status =3D "disabled";
> > > > > > > > +};
> > > > > > > > diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb
> > > > > > > > b/recipes-kernel/linux/linux-ti-staging_4.4.bb
> > > > > > > > index a9b99c0..620a789 100644
> > > > > > > > --- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
> > > > > > > > +++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
> > > > > > > > @@ -52,7 +52,7 @@ KERNEL_DEVICETREE_beaglebone =3D
> "am335x-
> > > > > > > bone.dtb
> > > > > > > > am335x-boneblack.dtb am335x-bone
> KERNEL_DEVICETREE_omap5-
> > > evm
> > > > > =3D
> > > > > > > "omap5-uevm.dtb"
> > > > > > > >  KERNEL_DEVICETREE_dra7xx-evm =3D "dra7-evm.dtb
> > > > > > > > dra7-evm-lcd-lg.dtb
> > > > > > > dra7-evm-lcd-osd.dtb dra72-evm.dtb dra72-evm-revc.dtb
> > > > > > > dra72-evm-lcd- lg.dtb dra72-evm-lcd-osd.dtb"
> > > > > > > >  KERNEL_DEVICETREE_dra7xx-hs-evm =3D
> > > > > "${KERNEL_DEVICETREE_dra7xx-
> > > > > > > evm}"
> > > > > > > > -KERNEL_DEVICETREE_am57xx-evm =3D "am57xx-beagle-x15.dtb
> > > am57xx-
> > > > > > > beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb
> > > am571x-
> > > > > > > idk.dtb am572x-idk.dtb am571x-idk-lcd-osd.dtb
> > > > > > > am572x-idk-lcd-
> > > osd.dtb"
> > > > > > > > +KERNEL_DEVICETREE_am57xx-evm =3D "am57xx-beagle-x15.dtb
> > > am57xx-
> > > > > > > beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb
> > > am571x-
> > > > > > > idk.dtb am572x-idk.dtb am571x-idk-lcd-osd.dtb
> > > > > > > am572x-idk-lcd-osd.dtb am572x-idk-pru-excl-uio.dtb"
> > > > > > >
> > > > > > > NACK, you are adding it here unconditionally.
> > > > > >
> > > > > > Are you expecting this to be conditional to ENABLE_TI_UIO_DEVIC=
ES?
> > > > > > Please clarify.
> > > > >
> > > > > The rest of your code is, isn't it?
> > >
> > > That is what I meant - the rest of uio is conditional, so adding new
> > > DTB unconditionally is at least confusing... DTB should also be condi=
tional.
> >
> > Ok.  I understand the feedback.
> > This is little bit new to me, so I may need some help with this.
> > Need something like:
> > #if ${ENABLE_TI_UIO_DEVICES}
> > KERNEL_DEVICETREE_append_am57xx-evm =3D " am572x-idk-pru-excl-
> uio.dtb"
> > #endif
> > I don't a quick solution on how to do this in the recipe .inc file.
> > If we already do this for other variables in any of the recipes, please=
 let me
> know.
> > Appreciate your help.
>=20
> In uio.inc file add this:
>=20
> KERNEL_DEVICETREE_append_am57xx-evm =3D
> "${@base_conditional("ENABLE_TI_UIO_DEVICES", "1", " am572x-idk-pru-
> excl-uio.dtb", "", d)}"

Thanks Denys.

>=20
>=20
> > > > Actually the dtb file is created, even if ENABLE_TI_UIO_DEVICES is
> > > > not
> > > defined.
> > > > Only the uio device tree entries are added based on this variable.
> > > >
> > > > >
> > > > > > > >  KERNEL_DEVICETREE_omap3 =3D "omap3-beagle.dtb omap3-
> beagle-
> > > > > xm.dtb
> > > > > > > omap3-beagle-xm-ab.dtb omap3-evm.dtb omap3-evm-37xx.dtb
> > > am3517-
> > > > > > > evm.dtb"
> > > > > > > >  KERNEL_DEVICETREE_am3517-evm =3D "am3517-evm.dtb"
> > > > > > > >  KERNEL_DEVICETREE_am37x-evm =3D "omap3-evm-37xx.dtb"
> > > > > > > > diff --git a/recipes-kernel/linux/ti-uio.inc
> > > > > > > > b/recipes-kernel/linux/ti-uio.inc index 776e4a4..4764d78
> > > > > > > > 100644
> > > > > > > > --- a/recipes-kernel/linux/ti-uio.inc
> > > > > > > > +++ b/recipes-kernel/linux/ti-uio.inc
> > > > > > > > @@ -2,6 +2,7 @@ SRC_URI_append_keystone =3D "
> > > > > > > > file://keystone-
> > > > > uio.dtsi"
> > > > > > > >  SRC_URI_append_k2hk-evm =3D " file://k2hk-uio.dtsi"
> > > > > > > >  SRC_URI_append_k2l-evm =3D " file://k2l-uio.dtsi"
> > > > > > > >  SRC_URI_append_k2e-evm =3D " file://k2e-uio.dtsi"
> > > > > > > > +SRC_URI_append_am57xx-evm =3D " file://am572x-pru-uio.dtsi=
"
> > > > > > > >
> > > > > > > >  DTSI_LIST =3D ""
> > > > > > > >  DTSI_LIST_append_keystone =3D " keystone-uio.dtsi"
> > > > > > > > @@ -24,4 +25,15 @@ do_setup_uio() {
> > > > > > > >      fi
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +do_setup_uio_append_am57xx-evm() {
> > > > > > > > +    dts=3D"am572x-idk-pru-excl-uio.dts"
> > > > > > > > +    dtsi=3D"am572x-pru-uio.dtsi"
> > > > > > > > +    cp ${S}/arch/arm/boot/dts/am572x-idk.dts
> > > > > ${S}/arch/arm/boot/dts/$dts
> > > > > > > > +    if [ "${ENABLE_TI_UIO_DEVICES}" =3D=3D "1" ]
> > > > > > > > +    then
> > > > > > > > +        cp ${WORKDIR}/${dtsi} ${S}/arch/arm/boot/dts/
> > > > > > > > +        echo "#include \"${dtsi}\"" >> ${S}/arch/arm/boot/=
dts/$dts
> > > > > > > > +    fi
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  do_patch[postfuncs] +=3D "do_setup_uio"
> > > > > > > > --
> > > > > > > > 1.9.1
> > > > > > > >
> > > > > > > > --
> > > > > > > > _______________________________________________
> > > > > > > > meta-ti mailing list
> > > > > > > > meta-ti@yoctoproject.org
> > > > > > > > https://lists.yoctoproject.org/listinfo/meta-ti

