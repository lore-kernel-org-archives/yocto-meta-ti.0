Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22931E00596
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 11:10:05 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYF00MQX6KDWI21@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 26 Jan 2012 13:09:50 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3C8F4201F9; Thu,
	26 Jan 2012 14:09:49 -0500 (EST)
Date: Thu, 26 Jan 2012 14:09:49 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20120126190949.GA18244@denix.org>
References: <1327604455-4778-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1327604455-4778-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] arm-benchmarks: port of am-benchmarks from arago
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
X-List-Received-Date: Thu, 26 Jan 2012 19:10:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 26, 2012 at 01:00:55PM -0600, Chase Maupin wrote:
> * Ported the am-benchmarks recipe from arago and changed the name
>   to arm-benchmarks.
> * Updated the SRCREV to pickup licensing file
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb |   26 +++++++++++++++++++++++
>  1 files changed, 26 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb
> 
> diff --git a/recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb b/recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb
> new file mode 100644
> index 0000000..c7a8e12
> --- /dev/null
> +++ b/recipes-ti/arm-benchmarks/arm-benchmarks_1.3.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "AM Benchmarks"

Didn't you change the name? ^^^


> +HOMEPAGE = "https://gforge.ti.com/gf/project/am_benchmarks/"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
> +SECTION = "system"
> +
> +SRCREV = "76"
> +PR = "r0+svnr${SRCPV}"
> +
> +SRC_URI = "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;proto=https;user=anonymous;pswd=''"
> +
> +S = "${WORKDIR}/trunk"
> +
> +do_compile() {
> +	export CROSS_COMPILE=${TARGET_PREFIX}
> +	export ARCH=${TUNE_PKGARCH}
> +	# build the release version
> +	make release 
> +}
> +
> +do_install() {
> +	export ARCH=${TUNE_PKGARCH}
> +	make DESTDIR=${D} install
> +}
> +
> +RDEPENDS += matrix-gui-armbenchmarks-demos

Do we really need to RDEPENDS on matrix?

-- 
Denys

