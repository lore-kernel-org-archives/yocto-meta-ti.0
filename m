Return-Path: <fw@javox-solutions.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97CE6E007AA; Tue, 21 Mar 2017 01:54:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [80.67.31.100 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from smtprelay05.ispgateway.de (smtprelay05.ispgateway.de
	[80.67.31.100])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA9CFE00524
	for <meta-ti@yoctoproject.org>; Tue, 21 Mar 2017 01:54:36 -0700 (PDT)
Received: from [89.1.50.161] (helo=[192.168.178.77])
	by smtprelay05.ispgateway.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES128-SHA:128) (Exim 4.84)
	(envelope-from <fw@javox-solutions.com>) id 1cqFYo-00041j-Hj
	for meta-ti@yoctoproject.org; Tue, 21 Mar 2017 09:54:34 +0100
To: meta-ti@yoctoproject.org
References: <1490035085-42076-1-git-send-email-denys@ti.com>
	<1490035085-42076-4-git-send-email-denys@ti.com>
From: Florian Wickert <fw@javox-solutions.com>
Message-ID: <5bda86bb-c724-daf0-8170-edf05519dff4@javox-solutions.com>
Date: Tue, 21 Mar 2017 09:53:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1490035085-42076-4-git-send-email-denys@ti.com>
X-Df-Sender: ZndAamF2b3gtc29sdXRpb25zLmNvbQ==
Subject: Re: [morty/master][PATCH 4/4] beagle-x15: add separate config for BeagleBoard X15
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
X-List-Received-Date: Tue, 21 Mar 2017 08:54:38 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

I don't see the
UBOOT_MACHINE = "beagle_x15_config"
in the current u-boot-ti-staging sources.
At least not in ti-u-boot-2017.01 and ti-u-boot-2017.01-next branches.


On 03/20/2017 07:38 PM, Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   conf/machine/beagle-x15.conf | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 conf/machine/beagle-x15.conf
>
> diff --git a/conf/machine/beagle-x15.conf b/conf/machine/beagle-x15.conf
> new file mode 100644
> index 0000000..276de26
> --- /dev/null
> +++ b/conf/machine/beagle-x15.conf
> @@ -0,0 +1,34 @@
> +#@TYPE: Machine
> +#@NAME: BeagleBoard X15
> +#@DESCRIPTION: Machine configuration for the BeagleBoard X15
> +
> +require conf/machine/include/dra7xx.inc
> +
> +IMAGE_FSTYPES += "tar.xz"
> +
> +SERIAL_CONSOLE = "115200 ttyS2"
> +
> +KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb"
> +
> +UBOOT_MACHINE = "beagle_x15_config"
> +
> +# UBI information.  Note that this is board and kernel specific.  Changes
> +# in your kernel port may require changes in these variables.  For more
> +# details about this board please see
> +# http://processors.wiki.ti.com/index.php/UBIFS_Support
> +
> +# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
> +# From dmesg:
> +# UBI: smallest flash I/O unit:    2048
> +# UBI: logical eraseblock size:    126976 bytes
> +# from ubiattach stdout:
> +# UBI device number 0, total 1988 LEBs
> +MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 8192"
> +
> +# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
> +# from dmesg:
> +# UBI: smallest flash I/O unit:    2048
> +# UBI: physical eraseblock size:   131072 bytes (128 KiB)
> +# UBI: sub-page size:              512
> +# UBI: VID header offset:          2048 (aligned 2048)
> +UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"


