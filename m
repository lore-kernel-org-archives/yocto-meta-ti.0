Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 167E2E0123C
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 22 Dec 2011 09:50:23 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LWM009QI9JO1LK2@vms173013.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Thu, 22 Dec 2011 11:50:13 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4226520334; Thu,
	22 Dec 2011 12:50:11 -0500 (EST)
Date: Thu, 22 Dec 2011 12:50:11 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20111222175011.GE17606@denix.org>
References: <1324568025-24923-1-git-send-email-koen@dominion.thruhere.net>
	<1324568025-24923-2-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1324568025-24923-2-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 2/2] ti-cgt6x: add 7.2.7
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
X-List-Received-Date: Thu, 22 Dec 2011 17:50:24 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Dec 22, 2011 at 04:33:45PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-ti/devtools/ti-cgt6x_7.2.7.bb |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-ti/devtools/ti-cgt6x_7.2.7.bb
> 
> diff --git a/recipes-ti/devtools/ti-cgt6x_7.2.7.bb b/recipes-ti/devtools/ti-cgt6x_7.2.7.bb
> new file mode 100644
> index 0000000..aab1b96
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt6x_7.2.7.bb
> @@ -0,0 +1,11 @@
> +require ti-cgt6x.inc
> +
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=62f46f1125a152a2e213b414db7ac600"
> +
> +PE = "1"
> +PV = "7_2_7"
> +PVwithdots = "7.2.7"
> +
> +SRC_URI[cgt6xbin.md5sum] = "71a0768a541fdebd9c35d44301019d1d"
> +SRC_URI[cgt6xbin.sha256sum] = "211477f0142d603975544abe3c45cc3b77a3b38038158676c60812806378738b"
> +
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

