Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BEF80E00B31; Fri,  2 Aug 2019 17:18:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C067CE00AE4
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 17:18:46 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x730Ij1w047473;
	Fri, 2 Aug 2019 19:18:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564791525;
	bh=RGgp6nd5xor8Q0aIhreGo8uX850KV5Jik1Rps6cNeZk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=k+pF7YPVHb4/52O9FuQuo16j+CtvOSI0ROMAVgBByfpsn2kmDnbN/z4XZ3bYPXRlB
	pkj5KXR2tuXcQsnnQ2agwp8QJhidfUviBVeX6yaV6xO+gQonn2bq0xYHyxC08Op16d
	lZM1dYwLWB5XHaBUSy+DauqqYTxs3sd7vjkWzJ08=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x730Ijw9015589
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Aug 2019 19:18:45 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 19:18:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 2 Aug 2019 19:18:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x730Iidd070825;
	Fri, 2 Aug 2019 19:18:45 -0500
Date: Fri, 2 Aug 2019 20:18:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20190803001844.GA20944@beryl>
References: <20190802233401.26778-1-jbergsagel@ti.com>
	<CADySD0EWbPA1+Rauwd=c3mWMJ=kdawoZ4nS+TwF+TGpLR=UQyA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0EWbPA1+Rauwd=c3mWMJ=kdawoZ4nS+TwF+TGpLR=UQyA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, Suman Anna <s-anna@ti.com>,
	Santosh Jha <sjha@ti.com>
Subject: Re: [PATCH v3] ipc-lld: add AM65xx IPC echo_test firmware binaries
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
X-List-Received-Date: Sat, 03 Aug 2019 00:18:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Aug 03, 2019 at 12:10:14PM +1200, Ankur Tyagi wrote:
> On Sat, Aug 3, 2019 at 11:36 AM Jonathan Bergsagel <jbergsagel@ti.com> wrote:
> >
> > Use IPC/LLD based IPC echo test binaries as an
> > alternative for AM65X Linux IPC testing.
> > Updated location of J721E firmware binaries as well,
> > with latest IPC/LLD commit.
> >
> > Signed-off-by: Jonathan Bergsagel <jbergsagel@ti.com>
> > ---
> >  recipes-bsp/ipc-lld/ipc-lld-fw_git.bb | 198 ++++++++++++++++----------
> >  1 file changed, 124 insertions(+), 74 deletions(-)
> >
> > diff --git a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
> > index f8157d8c6e5b..4c8743d021f3 100644
> > --- a/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
> > +++ b/recipes-bsp/ipc-lld/ipc-lld-fw_git.bb
> > @@ -6,67 +6,79 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7eae093f2b09fd39307f30028a068b91"
> >  inherit deploy
> >  inherit update-alternatives
> >
> > +COMPATIBLE_MACHINE = "k3"
> > +
> >  PV = "1.0-git${SRCPV}"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >
> >  PROTOCOL = "git"
> >  BRANCH = "master"
> > -SRCREV = "66764a5f063db606ea9db23380694bfd7d4aeafb"
> > +SRCREV = "81392da08fab2b5cfc23d63dbe71b7244a6af477"
> >
> >  SRC_URI = "git://git.ti.com/keystone-rtos/ipc-lld.git;protocol=${PROTOCOL};branch=${BRANCH}"
> >
> >  S = "${WORKDIR}/git"
> >
> > -R5_DSP_FW_DIR = "${S}/examples/echo_test/binaries"
> > +AM65X_R5_FW_DIR = "${S}/examples/echo_test/binaries/am65xx"
> > +J721E_R5_DSP_FW_DIR = "${S}/examples/echo_test/binaries/j721e"
> 
> Wouldn't it be nice to use machine overrides over here as well?
> R5_DSP_FW_DIR_am65xx = "${S}/examples/echo_test/binaries/am65xx"
> R5_DSP_FW_DIR_j7-evm = "${S}/examples/echo_test/binaries/j721e"

I kind of had the same comment earlier in the internal discussion - am65xx 
version doesn't provide DSP firmware, unlike J7, so it can't be named like 
that. The variable would need to be named more generic - i.e. FW_DIR and then 
have machine specific values. But regardless, it doesn't simplify or improve 
anything, as it will be the same number of lines. So I let it be the way the 
author intended...


> > +PLATFORM_am65xx = "am65xx"
> > +PLATFORM_j7-evm = "j7-evm"
> >
> >  # make sure that lib/firmware, and all its contents are part of the package
> >  FILES_${PN} += "${base_libdir}/firmware"
> >
> >  # install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
> >  do_install() {
> > -  install -d ${D}${base_libdir}/firmware/pdk-ipc
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.strip.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.strip.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.xe71 ${D}${base_libdir}/firmware/pdk-ipc/
> > -  install -m 0644 ${R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.strip.xe71 ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -d ${D}${base_libdir}/firmware/pdk-ipc
> > +}
> > +
> > +do_install_append_am65xx() {
> > +    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +}
> > +
> > +do_install_append_j7-evm() {
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.strip.xer5f ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.strip.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.strip.xe66 ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.xe71 ${D}${base_libdir}/firmware/pdk-ipc/
> > +    install -m 0644 ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.strip.xe71 ${D}${base_libdir}/firmware/pdk-ipc/
> >  }
> >
> > -TARGET_MCU_R5FSS0_0 = "j7-mcu-r5f0_0-fw"
> > -TARGET_MCU_R5FSS0_1 = "j7-mcu-r5f0_1-fw"
> > -TARGET_MAIN_R5FSS0_0 = "j7-main-r5f0_0-fw"
> > -TARGET_MAIN_R5FSS0_1 = "j7-main-r5f0_1-fw"
> > -TARGET_MAIN_R5FSS1_0 = "j7-main-r5f1_0-fw"
> > -TARGET_MAIN_R5FSS1_1 = "j7-main-r5f1_1-fw"
> > -TARGET_C66_0 = "j7-c66_0-fw"
> > -TARGET_C66_1 = "j7-c66_1-fw"
> > -TARGET_C7X = "j7-c71_0-fw"
> > -ALTERNATIVE_${PN} = "\
> > +# Set up names for the firmwares
> > +ALTERNATIVE_am65xx = "\
> > +                    am65x-mcu-r5f0_0-fw \
> > +                    am65x-mcu-r5f0_1-fw \
> > +                    "
> > +ALTERNATIVE_j7-evm = "\
> >                      j7-mcu-r5f0_0-fw \
> >                      j7-mcu-r5f0_1-fw \
> >                      j7-main-r5f0_0-fw \
> > @@ -77,6 +89,25 @@ ALTERNATIVE_${PN} = "\
> >                      j7-c66_1-fw \
> >                      j7-c71_0-fw\
> >                      "
> > +
> > +# Set up link names for the firmwares
> > +
> > +TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
> > +TARGET_MCU_R5FSS0_1_am65xx = "am65x-mcu-r5f0_1-fw"
> > +
> > +TARGET_MCU_R5FSS0_0_j7-evm = "j7-mcu-r5f0_0-fw"
> > +TARGET_MCU_R5FSS0_1_j7-evm = "j7-mcu-r5f0_1-fw"
> > +TARGET_MAIN_R5FSS0_0_j7-evm = "j7-main-r5f0_0-fw"
> > +TARGET_MAIN_R5FSS0_1_j7-evm = "j7-main-r5f0_1-fw"
> > +TARGET_MAIN_R5FSS1_0_j7-evm = "j7-main-r5f1_0-fw"
> > +TARGET_MAIN_R5FSS1_1_j7-evm = "j7-main-r5f1_1-fw"
> > +TARGET_C66_0_j7-evm = "j7-c66_0-fw"
> > +TARGET_C66_1_j7-evm = "j7-c66_1-fw"
> > +TARGET_C7X_j7-evm = "j7-c71_0-fw"
> > +
> > +ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> > +ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> > +
> >  ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
> >  ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> >  ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
> > @@ -86,6 +117,12 @@ ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAI
> >  ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${base_libdir}/firmware/${TARGET_C66_0}"
> >  ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${base_libdir}/firmware/${TARGET_C66_1}"
> >  ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X}"
> > +
> > +# Create the firmware alternatives
> > +
> > +ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release.strip.xer5f"
> > +ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release.strip.xer5f"
> > +
> >  ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release.strip.xer5f"
> >  ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release.strip.xer5f"
> >  ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release.strip.xer5f"
> > @@ -99,38 +136,51 @@ ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test
> >  ALTERNATIVE_PRIORITY = "10"
> >
> >  # copy the executables into the deploy directory
> > -do_deploy () {
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.strip.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.strip.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.strip.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.strip.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.strip.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.strip.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.strip.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.strip.xer5f ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.strip.xe66 ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.strip.xe66 ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.xe71 ${DEPLOYDIR}/
> > -  install ${R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.strip.xe71 ${DEPLOYDIR}/
> > +
> > +do_deploy() {
> > +    :
> >  }
> > +
> > +do_deploy_am65xx() {
> > +    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
> > +    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
> > +    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
> > +    install ${AM65X_R5_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
> > +}
> > +
> > +do_deploy_j7-evm() {
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_0_release.strip.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu1_1_release.strip.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_0_release.strip.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_0_release.strip.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu2_1_release.strip.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu2_1_release.strip.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_0_release.strip.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_0_release.strip.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_mcu3_1_release.strip.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_testb_mcu3_1_release.strip.xer5f ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.xe66 ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_1_release.strip.xe66 ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.xe66 ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c66xdsp_2_release.strip.xe66 ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.xe71 ${DEPLOYDIR}/
> > +    install ${J721E_R5_DSP_FW_DIR}/ipc_echo_test_c7x_1_release.strip.xe71 ${DEPLOYDIR}/
> > +}
> > +
> >  addtask deploy after do_install before do_build
> >
> >  # This is used to prevent the build system to strip the executables
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

