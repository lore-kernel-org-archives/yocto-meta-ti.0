Return-Path: <koen@beagleboard.org>
Received: from mail-fx0-f48.google.com (mail-fx0-f48.google.com
	[209.85.161.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69253E005BB
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 22:41:13 -0700 (PDT)
Received: by faap14 with SMTP id p14so1935598faa.35
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 22:41:12 -0700 (PDT)
Received: by 10.223.17.23 with SMTP id q23mr2515503faa.18.1319607672348;
	Tue, 25 Oct 2011 22:41:12 -0700 (PDT)
Received: from [10.192.5.224] ([85.13.70.251])
	by mx.google.com with ESMTPS id s5sm2107242fab.2.2011.10.25.22.41.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Oct 2011 22:41:11 -0700 (PDT)
Message-Id: <82EB1A3D-8AAA-4D21-AEE9-4A66BFF79DD5@dominion.thruhere.net>
From: Koen Kooi <koen@beagleboard.org>
To: meta-ti@yoctoproject.org
In-Reply-To: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Wed, 26 Oct 2011 07:41:09 +0200
References: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
X-Mailer: Apple Mail (2.936)
Subject: Re: [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable usb-to-serial drivers
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Oct 2011 05:41:13 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

As a general remark: could you also list the git repo where your  
patches can be pulled from? That will save me a lot of email troubles  
while traveling.

Op 26 okt 2011, om 02:13 heeft Joel A Fernandes het volgende geschreven:

> Enable the PL2303 usb-to-serial driver required for serial output
> from the beaglebone tester.
>
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> .../linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig |    3 ++-
> recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb  |    2 +-
> 2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/ 
> beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x- 
> psp-3.0+3.1rc/beaglebone/defconfig
> index 4b3c21d..478ec3e 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/ 
> defconfig
> +++ b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/ 
> defconfig
> @@ -2558,7 +2558,8 @@ CONFIG_USB_LIBUSUAL=y
> # USB port drivers
> #
> # CONFIG_USB_USS720 is not set
> -# CONFIG_USB_SERIAL is not set
> +CONFIG_USB_SERIAL=y
> +CONFIG_USB_SERIAL_PL2303=y
>
> #
> # USB Miscellaneous drivers
> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb b/ 
> recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> index bffebea..fbee01f 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
> @@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
>
> BRANCH = "master"
> SRCREV = "1955a86594526e18f03c8d62db81119ffc4ccf0f"
> -MACHINE_KERNEL_PR_append = "k+gitr${SRCREV}"
> +MACHINE_KERNEL_PR_append = "l+gitr${SRCREV}"
>
> COMPATIBLE_MACHINE = "(ti33x)"
>
> -- 
> 1.7.0.4
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


