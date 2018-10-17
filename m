Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B5973E00AB9; Wed, 17 Oct 2018 07:17:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99B35E00A94
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 07:17:42 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9HEHPNV128669;
	Wed, 17 Oct 2018 09:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539785845;
	bh=x4KTYCHpCQHvnwHKrB+pheNEcBburoOcQ6tveC1TPyo=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=S6XLTvl2MGRZDRjS7Wo9WBVU2zfAG6oC7ICv8ynScCNh6N5pIHl84iU3VX93MHMVb
	9K5MwA8nkXuNNmmF2w5MMrXsOFV1lHjlHJGyrSfv8l0HAcb6tnkl6YlYw6XFf0p5Fd
	YF2/NEuKbZ4aTPzLoc3DE8kBo7anA5gl9znIxvDU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HEHPcw011577;
	Wed, 17 Oct 2018 09:17:25 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 17 Oct 2018 09:17:24 -0500
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1466.003; Wed, 17 Oct 2018 09:17:24 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: Daniel Gorsulowski <daniel.gorsulowski@esd.eu>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [EXTERNAL] [meta-ti] icss-emac-lld: how is /dev/uio_pruss_mem
	created?
Thread-Index: AQHUZhhVf0ymtsUtSUiZtC4PaWUdLqUjey6A
Date: Wed, 17 Oct 2018 14:17:24 +0000
Message-ID: <9f7fc5fcf66e49daae1e6ad995e98fe3@ti.com>
References: <bba4a971-2213-5b04-5fca-87e82d7d8591@esd.eu>
In-Reply-To: <bba4a971-2213-5b04-5fca-87e82d7d8591@esd.eu>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.118.207]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] icss-emac-lld: how is /dev/uio_pruss_mem created?
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
X-List-Received-Date: Wed, 17 Oct 2018 14:17:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

In order to get /dev/uio_pruss_mem, we need to use am335x-icev2-pru-excl-ui=
o.dtb as the default dtb. Details can be found from PSDK documentation:=20

http://software-dl.ti.com/processor-sdk-linux/esd/docs/latest/linux/Industr=
ial_Protocols_PRU-ICSS.html#linux-user-space-drivers-and-application
"On the filesystem under /boot directory, link am335x-icev2-pru-excl-uio.dt=
b as the default dtb to support PRUSS Ethernet ports, i.e., am335x-icev2-pr=
ueth.dtb."

Thanks,
Hongmei

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Daniel Gorsulowski
Sent: Wednesday, October 17, 2018 8:43 AM
To: meta-ti@yoctoproject.org
Subject: [EXTERNAL] [meta-ti] icss-emac-lld: how is /dev/uio_pruss_mem crea=
ted?

Hello!

I have baked the recipes icss-emac-lld and icss-emac-lld-test. When I=20
now start the resulting binary /usr/bin/icss_emacMainTest_am335x.out, I=20
get a segmentation fault when opening /dev/uio_pruss_mem. This node does=20
not exist.
How do I create this node, or for which recipe are there dependencies,=20
so that this node is created automatically?

PS: My .dts has been patched with the=20
recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi. Is there anything=20
else to do?

Kind regards,
Daniel Gorsulowski
--=20
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

