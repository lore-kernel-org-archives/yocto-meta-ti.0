Return-Path: <ceh@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C559E008DC; Fri, 27 Feb 2015 04:48:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28D44E0077E
	for <meta-ti@yoctoproject.org>; Fri, 27 Feb 2015 04:48:31 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1RCmULL013439;
	Fri, 27 Feb 2015 06:48:30 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1RCmTfN021190;
	Fri, 27 Feb 2015 06:48:29 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 27 Feb 2015 06:48:28 -0600
Received: from [158.218.103.10] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1RCmSD5024310;
	Fri, 27 Feb 2015 06:48:28 -0600
Message-ID: <54F0679C.4030007@ti.com>
Date: Fri, 27 Feb 2015 07:48:28 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Arago Project git <git@arago-project.org>, <meta-ti@yoctoproject.org>
References: <20150227013301.531B352A65@arago-project.org>
In-Reply-To: <20150227013301.531B352A65@arago-project.org>
Subject: Re: Denys Dmytriyenko : udev: rules for seamless transition to 8250_omap serial driver
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
X-List-Received-Date: Fri, 27 Feb 2015 12:48:36 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Carlos Hernandez <ceh@ti.com>

On 02/26/2015 08:33 PM, Arago Project git wrote:
> Module: meta-ti
> Branch: master
> Commit: 4ce69eff28103778508d23af766e6204c95595d3
> URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4ce69eff28103778508d23af766e6204c95595d3
>
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Thu Feb 26 14:51:40 2015 -0500
>
> udev: rules for seamless transition to 8250_omap serial driver
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>
> ---
>
>   recipes-core/udev/udev/omap-tty.rules |   17 +++++++++++++++++
>   recipes-core/udev/udev_%.bbappend     |    9 +++++++++
>   2 files changed, 26 insertions(+), 0 deletions(-)
>
> diff --git a/recipes-core/udev/udev/omap-tty.rules b/recipes-core/udev/udev/omap-tty.rules
> new file mode 100644
> index 0000000..989d60f
> --- /dev/null
> +++ b/recipes-core/udev/udev/omap-tty.rules
> @@ -0,0 +1,17 @@
> +# There are a number of modifiers that are allowed to be used in some
> +# of the different fields. They provide the following subsitutions:
> +#
> +# %n the "kernel number" of the device.
> +#    For example, 'sda3' has a "kernel number" of '3'
> +# %e the smallest number for that name which does not matches an existing node
> +# %k the kernel name for the device
> +# %M the kernel major number for the device
> +# %m the kernel minor number for the device
> +# %b the bus id for the device
> +# %c the string returned by the PROGRAM
> +# %s{filename} the content of a sysfs attribute
> +# %% the '%' char itself
> +#
> +
> +# Backward compatibility with old OMAP UART-style ttyO0 naming
> +SUBSYSTEM=="tty", ATTR{uartclk}!="0", KERNEL=="ttyS[0-9]", SYMLINK+="ttyO%n"
> diff --git a/recipes-core/udev/udev_%.bbappend b/recipes-core/udev/udev_%.bbappend
> new file mode 100644
> index 0000000..fd0d99b
> --- /dev/null
> +++ b/recipes-core/udev/udev_%.bbappend
> @@ -0,0 +1,9 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI_append = " file://omap-tty.rules"
> +
> +PR_append = ".0"
> +
> +do_install_append() {
> +    install -m 0644 ${WORKDIR}/omap-tty.rules ${D}${sysconfdir}/udev/rules.d/
> +}
>


