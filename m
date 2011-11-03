Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C190E00559
	for <meta-ti@yoctoproject.org>; Thu,  3 Nov 2011 09:15:35 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LU300523EHI6QS0@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 03 Nov 2011 11:15:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8535614AF5D; Thu,
	03 Nov 2011 12:15:18 -0400 (EDT)
Date: Thu, 03 Nov 2011 12:15:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20111103161518.GB15391@denix.org>
References: <1320309987-31529-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1320309987-31529-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] beaglebone-getting-started: initial add
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
X-List-Received-Date: Thu, 03 Nov 2011 16:15:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Nov 03, 2011 at 09:46:26AM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-misc/payload/beaglebone-getting-started.bb |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-misc/payload/beaglebone-getting-started.bb
> 
> diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-misc/payload/beaglebone-getting-started.bb
> new file mode 100644
> index 0000000..d68de7e
> --- /dev/null
> +++ b/recipes-misc/payload/beaglebone-getting-started.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "BeagleBone Getting Started Guide"
> +
> +# Ask Jason
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"

Is this allowed (logically and/or legally)? It seems like defeating the 
purpose of checksumming the license definition of the package. I know it's 
done for the tasks, but tasks are not real packages - they are pure metadata. 
This one fetches a git repository, hence contains "code".

I believe the proper way, if the package even mentions its license, is to 
checksum that text directly or a portion of the code:

LIC_FILES_CHKSUM = "file://git/src/main.c;beginline=5;endline=9;md5=1234567890abcdef"

-- 
Denys


> +SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +	install -d ${datadir}/${PN}
> +	cp -a ${S}/* ${datadir}/${PN}
> +}
> +
> +FILES_${PN} += "${datadir}/${PN}"
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

