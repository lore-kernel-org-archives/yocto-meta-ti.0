Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3322CE00293
	for <meta-ti@yoctoproject.org>; Fri,  5 Oct 2012 12:01:06 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id CA9E2F8125C; Fri,  5 Oct 2012 13:01:05 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id EB6D2F8125A;
	Fri,  5 Oct 2012 13:01:04 -0600 (MDT)
Message-ID: <506F2E82.8060906@mlbassoc.com>
Date: Fri, 05 Oct 2012 13:01:22 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <1349465081-10787-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349465081-10787-1-git-send-email-fcooper@ti.com>
Subject: Re: [PATCH] wl12xx-firmware: Port wl12xx-firmware recipe
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
X-List-Received-Date: Fri, 05 Oct 2012 19:01:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-10-05 13:24, Franklin S. Cooper Jr wrote:
> * Port wl12xx-firmware recipe from arago. This recipe was originally
>    named linux-firmware in arago.
> * Wl12xx-firmware provides the firmware files for use with the TI
>    Wi-Fi + Bluetooth module.
>
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>

Why not just keep the main linux-firmware recipe up to date instead of duplicate
functionality?

> ---
>   recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb |   28 ++++++++++++++++++++
>   1 files changed, 28 insertions(+), 0 deletions(-)
>   create mode 100644 recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
>
> diff --git a/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb b/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
> new file mode 100644
> index 0000000..3fa9dbb
> --- /dev/null
> +++ b/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "Firmware files for use with TI wl12xx"
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=ba590e1d103f891d0151609046aef9e8"
> +
> +PACKAGE_ARCH = "all"
> +
> +PR = "r0+gitr${SRCREV}"
> +
> +# This recipe provides the latest firmware files for wl12xx.
> +# Therefore, use the contents of this recipe instead of the contents
> +# of linux-firmware-wl12xx.
> +RCONFLICTS_${PN} = "linux-firmware-wl12xx"
> +RREPLACES_${PN}  = "linux-firmware-wl12xx"
> +
> +SRCREV = "38e0dd7999b9087e00d1a59306a7c22fd23246cf"
> +SRC_URI = "git://github.com/TI-ECS/ti-utils.git;protocol=git"
> +
> +S = "${WORKDIR}/git/hw/firmware"
> +
> +do_compile() {
> +	:
> +}
> +
> +do_install() {
> +	oe_runmake 'DEST_DIR=${D}' install
> +}
> +
> +FILES_${PN} = "/lib/firmware/ti-connectivity/*"
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

