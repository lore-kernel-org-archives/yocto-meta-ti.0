Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6400EE0123C
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 22 Dec 2011 09:49:58 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LWM00JQM9J5O3CG@vms173001.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Thu, 22 Dec 2011 11:49:53 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 118AB20334; Thu,
	22 Dec 2011 12:49:52 -0500 (EST)
Date: Thu, 22 Dec 2011 12:49:52 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20111222174952.GD17606@denix.org>
References: <1324568025-24923-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1324568025-24923-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 1/2] ti-cgt6x: update to 6.1.20
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
X-List-Received-Date: Thu, 22 Dec 2011 17:49:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Dec 22, 2011 at 04:33:44PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-ti/devtools/ti-cgt6x_6.1.17.bb |   11 -----------
>  recipes-ti/devtools/ti-cgt6x_6.1.20.bb |   11 +++++++++++
>  2 files changed, 11 insertions(+), 11 deletions(-)
>  delete mode 100644 recipes-ti/devtools/ti-cgt6x_6.1.17.bb
>  create mode 100644 recipes-ti/devtools/ti-cgt6x_6.1.20.bb
> 
> diff --git a/recipes-ti/devtools/ti-cgt6x_6.1.17.bb b/recipes-ti/devtools/ti-cgt6x_6.1.17.bb
> deleted file mode 100644
> index d47ad3c..0000000
> --- a/recipes-ti/devtools/ti-cgt6x_6.1.17.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require ti-cgt6x.inc
> -
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=712a8c64bb70c5ea5fa193faef3bed6f"
> -
> -PE = "1"
> -PV = "6_1_17"
> -PVwithdots = "6.1.17"
> -
> -SRC_URI[cgt6xbin.md5sum] = "41ee41cc74800b06705804f7ef901447"
> -SRC_URI[cgt6xbin.sha256sum] = "7e1c8b67420abf6f2f44786811d0a2b5692e76194743bed714ec9087cc1a75c7"
> -
> diff --git a/recipes-ti/devtools/ti-cgt6x_6.1.20.bb b/recipes-ti/devtools/ti-cgt6x_6.1.20.bb
> new file mode 100644
> index 0000000..1d6609c
> --- /dev/null
> +++ b/recipes-ti/devtools/ti-cgt6x_6.1.20.bb
> @@ -0,0 +1,11 @@
> +require ti-cgt6x.inc
> +
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=62f46f1125a152a2e213b414db7ac600"
> +
> +PE = "1"
> +PV = "6_1_20"
> +PVwithdots = "6.1.20"
> +
> +SRC_URI[cgt6xbin.md5sum] = "39485ea8211960de0a958ab27106ab9b"
> +SRC_URI[cgt6xbin.sha256sum] = "a020142011c8160e24f6386f7696ecfbfe02dab2a6c83af74ce6b67eb1da9900"
> +
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

