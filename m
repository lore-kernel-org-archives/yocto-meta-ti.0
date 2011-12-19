Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E877E0121A
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 19 Dec 2011 11:59:44 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.48.17.70])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LWG0037BVIH09Y2@vms173013.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Mon, 19 Dec 2011 13:59:18 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 225B720333; Mon,
	19 Dec 2011 14:42:26 -0500 (EST)
Date: Mon, 19 Dec 2011 14:42:26 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20111219194226.GE6128@denix.org>
References: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
	<1324311340-16981-5-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1324311340-16981-5-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 5/5] ti-sysbios: add 6.33.00.19
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
X-List-Received-Date: Mon, 19 Dec 2011 19:59:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Dec 19, 2011 at 05:15:40PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-ti/bios/ti-sysbios_6.31.04.27.bb |    8 --------
>  recipes-ti/bios/ti-sysbios_6.33.00.19.bb |    9 +++++++++
>  2 files changed, 9 insertions(+), 8 deletions(-)
>  delete mode 100644 recipes-ti/bios/ti-sysbios_6.31.04.27.bb
>  create mode 100644 recipes-ti/bios/ti-sysbios_6.33.00.19.bb
> 
> diff --git a/recipes-ti/bios/ti-sysbios_6.31.04.27.bb b/recipes-ti/bios/ti-sysbios_6.31.04.27.bb
> deleted file mode 100644
> index 107affd..0000000
> --- a/recipes-ti/bios/ti-sysbios_6.31.04.27.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require ti-sysbios.inc
> -
> -PV = "6_31_04_27"
> -LIC_FILES_CHKSUM = "file://sysbios_6_31_04_27_manifest.html;md5=36efea2939274c46b73f5e170abaffcb"
> -
> -SRC_URI[sysbiosbin.md5sum] = "c82e1d3afc9e2d3e88b0e4137f152ed6"
> -SRC_URI[sysbiosbin.sha256sum] = "92337cf3197d2b7ffe2316f311cd163be7b470acbb032273894d7d39182f4227"
> -
> diff --git a/recipes-ti/bios/ti-sysbios_6.33.00.19.bb b/recipes-ti/bios/ti-sysbios_6.33.00.19.bb
> new file mode 100644
> index 0000000..4e2b445
> --- /dev/null
> +++ b/recipes-ti/bios/ti-sysbios_6.33.00.19.bb
> @@ -0,0 +1,9 @@
> +require ti-sysbios.inc
> +
> +PV = "6_33_00_19"
> +LIC_FILES_CHKSUM = "file://sysbios_${PV}_manifest.html;md5=94136ca9815f76603b7202a41f1d6f5e"
> +
> +SRC_URI[sysbiosbin.md5sum] = "e1a2f28a8b3087896bbd986696e1a908"
> +SRC_URI[sysbiosbin.sha256sum] = "b7e096662f5d928eb818bbb14474deb1e3e038fea34b516b248de637835121ec"
> +
> +S = "${WORKDIR}/ti/bios_${PV}"
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

