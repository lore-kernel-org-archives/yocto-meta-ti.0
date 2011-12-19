Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95BFEE00305
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 19 Dec 2011 11:59:18 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.48.17.70])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LWG008OKVIHDPP5@vms173005.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Mon, 19 Dec 2011 13:59:06 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 40A1E202E0; Mon,
	19 Dec 2011 14:42:01 -0500 (EST)
Date: Mon, 19 Dec 2011 14:42:01 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20111219194201.GD6128@denix.org>
References: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
	<1324311340-16981-4-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1324311340-16981-4-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 4/5] ti-ipc: update to 1_24_00_16
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
X-List-Received-Date: Mon, 19 Dec 2011 19:59:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Dec 19, 2011 at 05:15:39PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-ti/ipc/ti-ipc_1.23.02.27.bb |    9 ---------
>  recipes-ti/ipc/ti-ipc_1.24.00.16.bb |    8 ++++++++
>  2 files changed, 8 insertions(+), 9 deletions(-)
>  delete mode 100644 recipes-ti/ipc/ti-ipc_1.23.02.27.bb
>  create mode 100644 recipes-ti/ipc/ti-ipc_1.24.00.16.bb
> 
> diff --git a/recipes-ti/ipc/ti-ipc_1.23.02.27.bb b/recipes-ti/ipc/ti-ipc_1.23.02.27.bb
> deleted file mode 100644
> index 2176b13..0000000
> --- a/recipes-ti/ipc/ti-ipc_1.23.02.27.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require ti-ipc.inc
> -
> -LIC_FILES_CHKSUM = "file://ipc_1_23_02_27_manifest.html;md5=74cbdd9a526809df81e080f19b36eec7"
> -
> -PV = "1_23_02_27"
> -
> -SRC_URI[ipcbin.md5sum] = "8c45f6a81cef62f9717335911ee1c9cd"
> -SRC_URI[ipcbin.sha256sum] = "b16f29ef016819fe0632468e2f756e05508143cbc732bcaabd269571163b568e"
> -
> diff --git a/recipes-ti/ipc/ti-ipc_1.24.00.16.bb b/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
> new file mode 100644
> index 0000000..e7ae7ef
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-ipc_1.24.00.16.bb
> @@ -0,0 +1,8 @@
> +require ti-ipc.inc
> +
> +PV = "1_24_00_16"
> +
> +LIC_FILES_CHKSUM = "file://ipc_${PV}_manifest.html;md5=573f5a5c0448d28bf8db35f438244d7f"
> +
> +SRC_URI[ipcbin.md5sum] = "d2f7cc82310d555ca039dcd353bd94c5"
> +SRC_URI[ipcbin.sha256sum] = "96df7835e920c7dabcd63d30ec8bc2aea7cd0c6197c9fb9ca0f8a9b681aa5396"
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

