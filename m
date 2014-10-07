Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85354E00848; Tue,  7 Oct 2014 12:37:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F7C9E00786
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 12:36:59 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s97JawW6000760
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 14:36:58 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s97JawWj026198
	for <meta-ti@yoctoproject.org>; Tue, 7 Oct 2014 14:36:58 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 7 Oct 2014 14:36:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s97JawsV012612;
	Tue, 7 Oct 2014 14:36:58 -0500
Date: Tue, 7 Oct 2014 15:36:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20141007193657.GF1731@edge>
References: <1412681805-27235-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1412681805-27235-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 1/2] common-csl-ip: (ti-csl) Moved from meta-arago and renamed
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
X-List-Received-Date: Tue, 07 Oct 2014 19:37:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

And few more comments for the future (I'll fix those for now):


On Tue, Oct 07, 2014 at 07:36:44AM -0400, Sam Nelson wrote:
> - Moved from meta-arago ( where it was called ti-csl_git.bb)
>   http://arago-project.org/git/?p=meta-arago.git;a=blob_plain;f=meta-arago-extras/recipes-bsp/ti-csl/ti-csl_git.bb;hb=HEAD
> - Renamed it to common-csl-ip_git.bb
> - This package provides chip support library interface files
> 
> ---
> Changes from previous version of patch
> -Add comments on renaming and original url attached
> - rename to common-csl-ip_git.bb
> ---

Your SOB line gets lost, as it appears after the '---' delimiter.
The above "Changes" section should be after the SOB line below, as everything 
between the first '---' and 'diff' lines gets ignored.


> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---

I usually write patch revision changes here...


>  recipes-bsp/common-csl-ip/common-csl-ip_git.bb |   21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bb
> 
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
> new file mode 100644
> index 0000000..fb5e6f8
> --- /dev/null
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "TI CSL"
> +LICENSE = "TI BSD"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
> +
> +COMPATIBLE_MACHINE = "keystone"
> +ALLOW_EMPTY_${PN} = "1"
> +
> +PR = "r0"
> +BRANCH="master"
> +SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH}"
> +# commit ID corresponds to DEV.CSL_KEYSTONE2.02.00.00.17
> +SRCREV = "f6f90144c14e1ee783c4b893b52e54830be8166e" 

^^^ git-am complains there's a trailing whitespace at the end of SRCREV line.


> +S = "${WORKDIR}/git"
> +
> +do_install () {
> +    install -d ${D}${includedir}/ti/csl
> +    find . -name "*.h" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl 

^^^ As well as the first "find" command line has trailing whitespace.


> +    find ./src/ip/serdes_sb/V0 -name "*.c" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl
> +}
> +

^^^ Another complaint from git-am is the blank line at the end of the file.


Applying: common-csl-ip: (ti-csl) Moved from meta-arago and renamed
/OE/arago-daisy/sources/meta-ti/.git/rebase-apply/patch:30: trailing whitespace.
SRCREV = "f6f90144c14e1ee783c4b893b52e54830be8166e" 
/OE/arago-daisy/sources/meta-ti/.git/rebase-apply/patch:36: trailing whitespace.
    find . -name "*.h" -type f | xargs -I {} cp --parents {} 
${D}${includedir}/ti/csl 
/OE/arago-daisy/sources/meta-ti/.git/rebase-apply/patch:39: new blank line at EOF.
+
warning: 3 lines add whitespace errors.


> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

