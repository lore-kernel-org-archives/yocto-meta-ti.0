Return-Path: <fw@javox-solutions.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 518A1E00AFD; Mon, 20 Mar 2017 08:46:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [80.67.31.37 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
	[80.67.31.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D90DAE00AA7
	for <meta-ti@yoctoproject.org>; Mon, 20 Mar 2017 08:46:40 -0700 (PDT)
Received: from [89.1.50.161] (helo=[192.168.178.77])
	by smtprelay03.ispgateway.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES128-SHA:128) (Exim 4.84)
	(envelope-from <fw@javox-solutions.com>) id 1cpzW2-0007hu-MX
	for meta-ti@yoctoproject.org; Mon, 20 Mar 2017 16:46:38 +0100
To: meta-ti@yoctoproject.org
References: <CAMS2kBEyHe6y3rKD0RV=LXnSXR8kQY7yHuHtBQrb5gvDiX4RCg@mail.gmail.com>
From: Florian Wickert <fw@javox-solutions.com>
Message-ID: <3ab947d9-7e20-fd6e-6ef0-6754df59f1ae@javox-solutions.com>
Date: Mon, 20 Mar 2017 16:45:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAMS2kBEyHe6y3rKD0RV=LXnSXR8kQY7yHuHtBQrb5gvDiX4RCg@mail.gmail.com>
X-Df-Sender: ZndAamF2b3gtc29sdXRpb25zLmNvbQ==
Subject: Re: Trouble modifying defconfig for linux-ti-staging_rt recipe
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
X-List-Received-Date: Mon, 20 Mar 2017 15:46:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

You are right, it does not inherit the yocto linux bbclass.
Try setting this in your bbappend file:
KERNEL_CONFIG_FRAGMENTS_append = " ${WORKDIR}/eem.cfg"

Regards,
Florian


On 03/20/2017 04:44 PM, Glenn Schmottlach wrote:
> I am having trouble modifying the kernel configuration for the
> following TI kernel recipe using the Yocto Morty environment:
>
> linux-ti-staging-rt_4.9.bb
>
> I have created my own layer and with a *.bbappend file for this recipe, e.g.
>
> linux-ti-staging-rt_4.9.bbappend
>
> It appears the TI kernel recipes are not (yet) proper "Yocto" kernel
> recipes in that they are not "fragment" aware. It appears I cannot do
> the following inside of my *.bbappend recipe:
>
> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> SRC_URI += "file://eem.cfg"
>
> Inside of "eem.cfg" I want to set the following kernel options:
>
> CONFIG_USB_NET_CDC_EEM=m
> CONFIG_USB_F_EEM=m
> CONFIG_USB_ETH_EEM=y
>
> This has no affect. I tried creating my own defconfig based on the
> '.config' generated from the original recipe. I modified my *.bbappend
> file as follows:
>
> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> SRC_URI += "file://defconfig"
>
> Again, my defconfig is not applied to the build.
>
> I even tried patching kernel-source/ti_config_fragments and placing a
> eem.cfg in that directory hoping the configuration generation script
> (defconfig_builder.sh) might apply this fragment.
>
> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> SRC_URI += "file://0001-eem-config.patch"
>
> Where the patch contains:
>
> Index: kernel-source/ti_config_fragments/eem.cfg
> ===================================================================
> --- /dev/null
> +++ kernel-source/ti_config_fragments/eem.cfg
> @@ -0,0 +1,4 @@
> +CONFIG_USB_NET_CDC_EEM=m
> +CONFIG_USB_F_EEM=m
> +CONFIG_USB_ETH_EEM=y
> +
>
> Unfortunately this did not work either.
>
> I suspect this question has been asked before, but what is the
> RECOMMENDED procedure for making kernel configuration changes to the
> TI kernel recipes in a Yocto environment? What methods have others
> used to tweak the TI kernel options from their *.bbappend files?
>
> Thanks for any insights . . .


