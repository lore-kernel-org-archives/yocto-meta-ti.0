Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8200CE0045D; Mon,  3 Oct 2016 10:53:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 648A1E0043B
	for <meta-ti@yoctoproject.org>; Mon,  3 Oct 2016 10:53:51 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u93HrmnZ014036;
	Mon, 3 Oct 2016 12:53:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u93HrmuG006193;
	Mon, 3 Oct 2016 12:53:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 3 Oct 2016 12:53:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u93HrlMN004909;
	Mon, 3 Oct 2016 12:53:47 -0500
Date: Mon, 3 Oct 2016 13:53:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Thomas Perrot <thomas.perrot@tupi.fr>
Message-ID: <20161003175346.GB12745@edge>
References: <20161001124237.15032-1-thomas.perrot@tupi.fr>
MIME-Version: 1.0
In-Reply-To: <20161001124237.15032-1-thomas.perrot@tupi.fr>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] Fix Python3 build issues
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
X-List-Received-Date: Mon, 03 Oct 2016 17:53:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks! But I already have this in my queue along with other fixes for master 
that I've been working on. Sorry I haven't posted those earlier, but I'm still 
fighting couple remaining issues in related layers...

-- 
Denys


On Sat, Oct 01, 2016 at 02:42:37PM +0200, Thomas Perrot wrote:
> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> ---
>  recipes-ti/includes/ti-unpack.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-ti/includes/ti-unpack.inc b/recipes-ti/includes/ti-unpack.inc
> index 9101044..481e598 100644
> --- a/recipes-ti/includes/ti-unpack.inc
> +++ b/recipes-ti/includes/ti-unpack.inc
> @@ -48,7 +48,7 @@ python ti_bin_do_unpack() {
>      cmd_list = cmd_string.split( ":" )
>  
>      # Make the InstallJammer binary executable so we can run it
> -    os.chmod(binfile, 0755)
> +    os.chmod(binfile, 0o755)
>  
>      # Run the InstallJammer binary and accept the EULA
>      filename = "HOME=%s ./%s %s" % (workdir, binfile, arg_string)
> @@ -74,7 +74,7 @@ python ti_bin_do_unpack() {
>          tarfile  = bb.data.expand(tarfile, localdata)
>          tcmd = 'tar x --no-same-owner -f %s -C %s' % (tarfile, workdir)
>          if os.system(tcmd) != 0:
> -            print "ERROR: ti-eula-unpack: failed to extract tarfile"
> +            print("ERROR: ti-eula-unpack: failed to extract tarfile")
>              raise bb.build.FuncFailed()
>  
>      # Return to the previous directory
> -- 
> 2.9.3
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

