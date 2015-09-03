Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7B83E00CE0; Thu,  3 Sep 2015 09:25:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 961A7E009D7
	for <meta-ti@yoctoproject.org>; Thu,  3 Sep 2015 09:25:09 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t83GP8Qm019926;
	Thu, 3 Sep 2015 11:25:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t83GP8Ab025210;
	Thu, 3 Sep 2015 11:25:08 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 3 Sep 2015 11:25:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t83GP6KT002788;
	Thu, 3 Sep 2015 11:25:07 -0500
Date: Thu, 3 Sep 2015 12:24:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20150903162449.GI4305@edge>
References: <CADySD0E_yJCeRTS-chGrT0-SUqUfU8TpHTMWmzGmCfMjTS=UHg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0E_yJCeRTS-chGrT0-SUqUfU8TpHTMWmzGmCfMjTS=UHg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Using 1GB Nand with AM335x
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
X-List-Received-Date: Thu, 03 Sep 2015 16:25:14 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

No reason to send this to multiple lists, as neither of them is the correct 
list for these types of questions.

Please use http://e2e.ti.com forums instead. Thanks.

-- 
Denys


On Wed, Sep 02, 2015 at 03:42:42PM +1200, Ankur Tyagi wrote:
> Hi,
> 
> I have following queries regarding usage of 1GB Nand (MT29F8G16ABACAWP)
> with AM335x
> 
> - what is the meaning of cells in "reg" property of gpmc nand child node ?
> Information here is not clear
> http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/mtd/gpmc-nand.txt?v=3.14
> 
> - what should be the value of property "gpmc,device-width" if
> "nand-bus-width= <16>" ? I think it should be "2"
> 
> 
> Please confirm whether below is correct for 1GB 16-bit bus-width nand
> 
> &gpmc {
> 	status = "okay";
> 	pinctrl-names = "default", "sleep";
> 	pinctrl-0 = <&nandflash_pins_default>;
> 	pinctrl-1 = <&nandflash_pins_sleep>;
> 	ranges = <0 0 0x08000000 0x40000000>;	/* CS0: NAND */
> 	nand@0,0 {
> 		reg = <0 0 0>; /* CS0, offset 0 */
> 		ti,nand-ecc-opt = "bch16";
> 		ti,elm-id = <&elm>;
> 		nand-bus-width = <16>;
> 		gpmc,device-width = <2>;
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		partition@0 {
> 			label = "NAND.SPL";
> 			reg = <0x00000000 0x000040000>;
> 		};
> 		partition@1 {
> 			label = "NAND.SPL.backup1";
> 			reg = <0x00040000 0x00040000>;
> 		};
> 		partition@2 {
> 			label = "NAND.SPL.backup2";
> 			reg = <0x00080000 0x00040000>;
> 		};
> 		partition@3 {
> 			label = "NAND.SPL.backup3";
> 			reg = <0x000c0000 0x00040000>;
> 		};
> 		partition@4 {
> 			label = "NAND.u-boot-spl-os";
> 			reg = <0x00100000 0x00080000>;
> 		};
> 		partition@5 {
> 			label = "NAND.u-boot";
> 			reg = <0x00180000 0x00200000>;
> 		};
> 		partition@6 {
> 			label = "NAND.u-boot-env";
> 			reg = <0x00380000 0x00040000>;
> 		};
> 		partition@7 {
> 			label = "NAND.u-boot-env.backup1";
> 			reg = <0x003c0000 0x00040000>;
> 		};
> 		partition@8 {
> 			label = "NAND.kernel";
> 			reg = <0x00400000 0x00600000>;
> 		};
> 		partition@9 {
> 			label = "NAND.file-system";
> 			reg = <0x00A00000 0x1F600000>;
> 		};
> 	}
> }
> 
> 
> Please also confirm the following arguments for UBIFS :
> 
> mkfs.ubifs -r </path/rootfs> -o </path/rootfs.ubifs> -F –m 4096 –e
> 253952 –c 1918
> ubinize -o </path/rootfs.ubi> -m 4096 -p 256KiB -s 1024 -O 4096 ubinize.cfg
> ubiformat /dev/mtd9 -f rootfs.ubi -s 1024 -O 4096
> 
> 
> Thanks
> 
> Ankur

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


