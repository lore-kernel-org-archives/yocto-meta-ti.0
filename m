Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40261E0095D; Wed, 20 May 2015 09:09:32 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF361E004F6
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 09:09:29 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4KG9Rb7001193
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 11:09:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4KG9R6Z010586
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 11:09:27 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 May 2015 11:09:26 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4KG9QD1028297	for
	<meta-ti@yoctoproject.org>; Wed, 20 May 2015 11:09:26 -0500
Message-ID: <555CB1B7.1090002@ti.com>
Date: Wed, 20 May 2015 12:09:27 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>
References: <1430245299-14096-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1430245299-14096-1-git-send-email-j-stiffler@ti.com>
Subject: Re: [PATCH 1/2] llvm-common: Extend to nativesdk class.
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
X-List-Received-Date: Wed, 20 May 2015 16:09:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping.

On 4/28/2015 2:21 PM, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   recipes-core/llvm/llvm-common.bbappend |    5 +++++
>   1 file changed, 5 insertions(+)
>   create mode 100644 recipes-core/llvm/llvm-common.bbappend
>
> diff --git a/recipes-core/llvm/llvm-common.bbappend b/recipes-core/llvm/llvm-common.bbappend
> new file mode 100644
> index 0000000..65de0d8
> --- /dev/null
> +++ b/recipes-core/llvm/llvm-common.bbappend
> @@ -0,0 +1,5 @@
> +PR_append = "-arago0"
> +
> +SYSROOT_PREPROCESS_FUNCS_append_class-nativesdk = " llvm_common_sysroot_preprocess"
> +
> +BBCLASSEXTEND += "nativesdk"


