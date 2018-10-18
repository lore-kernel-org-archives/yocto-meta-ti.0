Return-Path: <Daniel.Gorsulowski@esd.eu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0B2AE00B81; Thu, 18 Oct 2018 02:36:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [212.59.41.8 listed in list.dnswl.org]
Received: from mxpout01.htp-tel.de (mxpout01.htp-tel.de [212.59.41.8])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9CE0EE00A0C
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2018 02:36:26 -0700 (PDT)
Received: from mxpin01.htp-tel.de (a212594129.net-htp.de [212.59.41.29])
	by mxpout01.htp-tel.de with ESMTPS id w9I9aKav014371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Oct 2018 11:36:20 +0200 (CEST)
Received: from esd-s3.esd.local (a81-14-233-218.net-htp.de [81.14.233.218])
	by mxpin01.htp-tel.de with ESMTPS id w9I9aJm3018841
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Oct 2018 11:36:20 +0200 (CEST)
Received: from [10.0.18.30] (10.0.18.30) by esd-s3.esd.local (10.0.0.66) with
	Microsoft SMTP Server (TLS) id 8.2.176.0;
	Thu, 18 Oct 2018 11:35:47 +0200
To: "Gou, Hongmei" <h-gou@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
References: <bba4a971-2213-5b04-5fca-87e82d7d8591@esd.eu>
	<9f7fc5fcf66e49daae1e6ad995e98fe3@ti.com>
From: Daniel Gorsulowski <daniel.gorsulowski@esd.eu>
Message-ID: <96e908c1-c03e-25de-bb20-86224dd37781@esd.eu>
Date: Thu, 18 Oct 2018 11:36:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <9f7fc5fcf66e49daae1e6ad995e98fe3@ti.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
	(mxpin01.htp-tel.de [172.19.12.4]);
	Thu, 18 Oct 2018 11:36:20 +0200 (CEST)
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
X-List-Received-Date: Thu, 18 Oct 2018 09:36:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

Hi Hongmei,

thanks! Your clue let me find my mistake. I added the missing

&pruss_soc_bus {
	status = "okay";
};

to my .dts and now it works!

Kind regards,
Daniel


Gou, Hongmei wrote:
> Hi Daniel,
> 
> In order to get /dev/uio_pruss_mem, we need to use am335x-icev2-pru-excl-uio.dtb as the default dtb. Details can be found from PSDK documentation:
> 
> http://software-dl.ti.com/processor-sdk-linux/esd/docs/latest/linux/Industrial_Protocols_PRU-ICSS.html#linux-user-space-drivers-and-application
> "On the filesystem under /boot directory, link am335x-icev2-pru-excl-uio.dtb as the default dtb to support PRUSS Ethernet ports, i.e., am335x-icev2-prueth.dtb."
> 
> Thanks,
> Hongmei
> 
> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Daniel Gorsulowski
> Sent: Wednesday, October 17, 2018 8:43 AM
> To: meta-ti@yoctoproject.org
> Subject: [EXTERNAL] [meta-ti] icss-emac-lld: how is /dev/uio_pruss_mem created?
> 
> Hello!
> 
> I have baked the recipes icss-emac-lld and icss-emac-lld-test. When I
> now start the resulting binary /usr/bin/icss_emacMainTest_am335x.out, I
> get a segmentation fault when opening /dev/uio_pruss_mem. This node does
> not exist.
> How do I create this node, or for which recipe are there dependencies,
> so that this node is created automatically?
> 
> PS: My .dts has been patched with the
> recipes-kernel/linux/files/ti33x/am335x-pru-uio.dtsi. Is there anything
> else to do?
> 
> Kind regards,
> Daniel Gorsulowski
> 

