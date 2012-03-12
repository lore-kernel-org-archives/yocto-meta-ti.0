Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F059E01363
	for <meta-ti@yoctoproject.org>; Mon, 12 Mar 2012 13:12:13 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0S00J7KG42RSC0@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 12 Mar 2012 15:12:02 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 36602202E0; Mon,
	12 Mar 2012 16:12:02 -0400 (EDT)
Date: Mon, 12 Mar 2012 16:12:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andreas M??ller <schnitzeltony@googlemail.com>
Message-id: <20120312201202.GA9300@denix.org>
References: <1331544485-5050-1-git-send-email-schnitzeltony@googlemail.com>
MIME-version: 1.0
In-reply-to: <1331544485-5050-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-eula-unpack: throw error message in case 32bit-glibc is missing
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
X-List-Received-Date: Mon, 12 Mar 2012 20:12:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 12, 2012 at 10:28:05AM +0100, Andreas M??ller wrote:
> TI installation tool requires 32bit glibc [1]
> 
> [1] https://lists.yoctoproject.org/pipermail/meta-ti/2012-January/000357.html
> 
> Signed-off-by: Andreas M??ller <schnitzeltony@googlemail.com>

Thanks, pushed with a slight update in the exception description.

-- 
Denys

> ---
>  recipes-ti/includes/ti-eula-unpack.inc |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-ti/includes/ti-eula-unpack.inc
> index 7c6e7b7..310d19f 100644
> --- a/recipes-ti/includes/ti-eula-unpack.inc
> +++ b/recipes-ti/includes/ti-eula-unpack.inc
> @@ -19,6 +19,14 @@ python ti_bin_do_unpack() {
>  
>      import os
>  
> +    # InstallJammer requires 32bit version of glibc
> +    lib32path = '/lib'
> +    if os.path.exists('/lib64') and ( os.path.islink('/lib64') or os.path.islink('/lib') ):
> +       lib32path = '/lib32'
> +    if not os.path.exists('%s/libc.so.6' % lib32path):
> +	raise bb.build.FuncFailed, \
> +        "\nTI installer requires 32bit glibc libraries for proper operation e.g on Fedora run 'yum install glibc.i686'"
> +
>      localdata = bb.data.createCopy(d)
>      bb.data.update_data(localdata)
>  
> -- 
> 1.7.6.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

