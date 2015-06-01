Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB472E00992; Mon,  1 Jun 2015 11:13:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46CCEE00945
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 11:13:08 -0700 (PDT)
Received: by ieczm2 with SMTP id zm2so115388247iec.1
	for <meta-ti@yoctoproject.org>; Mon, 01 Jun 2015 11:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ENGlqmQV76T+65OMB18yd01i2zllkJIsccd5zElVhys=;
	b=m7y3udIQxZCdspXyan26tzvwnCDvoYogZwjB3CXNyfjDNazQoWp9BhVSdJ+XDLuBi+
	j5ZnZ/f5Hhwlrc6TJdBRJoN+NIRFwUZwOh96vLCzcmCe4ztKDTnqUxG5mhtZ8xugWQa0
	w3Q/jQhn56pdVUjmJMLAiRd3HXFhWSxbhc0QwUHA6vmd4b9QAyyA4P2ICxZH2knOGEK/
	PxqL+3jDFHC6t8mm03Ff0Xe7RGoje1jploKdZkL/jKU7eB/ry+XOl7eUVN8dJA+7pPyO
	a715u7r7JVWvqAV7aPAnYnDBoZhfll5I6Vp9cV9D9Rj36InJnzMTCV8QZkFlr6N0EPVQ
	s4ww==
X-Received: by 10.50.79.232 with SMTP id m8mr15051981igx.6.1433182388423; Mon,
	01 Jun 2015 11:13:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.166 with HTTP; Mon, 1 Jun 2015 11:12:38 -0700 (PDT)
In-Reply-To: <20150601142306.8B3D552A3F@arago-project.org>
References: <20150601142306.8B3D552A3F@arago-project.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Jun 2015 11:12:38 -0700
Message-ID: <CAMKF1srahgFFVd8Z9D3wpRFHDTdfbnqg4P7sLDTbm2Q4mHXhOg@mail.gmail.com>
To: Arago Project git <git@arago-project.org>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Jacob Stiffler : llvm-common: Extend to nativesdk class.
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
X-List-Received-Date: Mon, 01 Jun 2015 18:13:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 1, 2015 at 7:23 AM, Arago Project git <git@arago-project.org> wrote:
> Module: meta-ti
> Branch: master
> Commit: 5c880613a30351e8dfa815ed82740aa5012ef0d4
> URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5c880613a30351e8dfa815ed82740aa5012ef0d4
>
> Author: Jacob Stiffler <j-stiffler@ti.com>
> Date:   Wed May 27 16:52:16 2015 +0000
>
> llvm-common: Extend to nativesdk class.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>
> ---
>
>  recipes-core/llvm/llvm-common.bbappend |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/recipes-core/llvm/llvm-common.bbappend b/recipes-core/llvm/llvm-common.bbappend
> new file mode 100644
> index 0000000..ffe4dcb
> --- /dev/null
> +++ b/recipes-core/llvm/llvm-common.bbappend
> @@ -0,0 +1,5 @@
> +PR_append = "-ti0"
> +
> +SYSROOT_PREPROCESS_FUNCS_append_class-nativesdk = " llvm_common_sysroot_preprocess"
> +
> +BBCLASSEXTEND += "nativesdk"
>

this should be going into meta-oe ?

