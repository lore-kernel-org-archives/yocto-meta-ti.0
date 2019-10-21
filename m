Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0758AE00A4C; Mon, 21 Oct 2019 14:31:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.222.196 listed in list.dnswl.org]
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D90A5E00973
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2019 14:31:06 -0700 (PDT)
Received: by mail-qk1-f196.google.com with SMTP id u22so14227268qkk.11
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2019 14:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=e8yAOOcdRSq3Ab32AKs9nwSNAgaxMmv4UsWFkDmMZTI=;
	b=eqdqIg/EyGYIe0exxDjNbgd7WOjwbkdVzDcg9MITczPgKC3qNS7v1lTaeLMPeBayRK
	cnUCyBYApMLt9ad+AZ+JxjTArCfsD+XE+eE3BaNiSBznLRsfHNJOA1/5fa9JwlC9WTZ6
	DyvLRXyorv4rHmbc9jDioU//8myi52zzmqPpe3fy8tFuTnzyENxNTjEpaLnC/Ep0eq3a
	eZHuABufmgnkWOQBoo/TsOvQZBMMASJlfgOrw6gSUmDuJ139B3Q74mNXRUtgq3rUNW3t
	YXP94dCfitymoAP7y2EJGQnzsQFkEdaAOk91vx0tfhXIhxPdF+WHM+kd0cwsLuSjoJh3
	7KGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=e8yAOOcdRSq3Ab32AKs9nwSNAgaxMmv4UsWFkDmMZTI=;
	b=HHpwwQ5aqemOKUb35F1u4+uTtl8KjsaoODx5fKkcFQvKV4JtnR7FvqCOamLAW+QokG
	lsDkJw7zxE2R1+MKgl3WSToN20QWi0nQSL3Vm9pkxqCYP82hjYLu9gzp+BfNapoNGXtu
	DHM8loi8+Ikd3Vk1fznVEzeS6v56tIoWd300lVx7Llp4Brybeaxxs+uS//Suij3U3TSO
	pdS3dQA3C0YFaD+JGIaBcZaDTPKeNY2Wylocvy1k/zm77kQT63qsqkpGUIWQcwqEobWE
	BN+x8dDo0reRQeOoeLPwQCkqyDAx11BQh/I3mHtO+CDJvnJgAaGPXpMUW0CBUvK9ZfWV
	Kr5A==
X-Gm-Message-State: APjAAAVQ4KC7rPsKvIYiAxxUL/E3PUfmCi178iUKNB6+oc/q/QGry54k
	QwdpEu4HRlI3wU0Ioue72NnghRgQNPIPgUdbGQ3FFAQ79G3ILA==
X-Google-Smtp-Source: APXvYqw0J/bSfZgAoHx9YjWwVdJs6PPstlFHs+0G2eG8fQrXPhLNE09JYt39Nk+i8PMeP2I3qd8F9ee1JTMXbTwyL/U=
X-Received: by 2002:a05:620a:1f6:: with SMTP id
	x22mr20130519qkn.474.1571693464877; 
	Mon, 21 Oct 2019 14:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <1571251103-152990-1-git-send-email-santa@ti.com>
In-Reply-To: <1571251103-152990-1-git-send-email-santa@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Oct 2019 14:30:37 -0700
Message-ID: <CAMKF1sq_OGPzX+qr8d_k3u9Sx1MDHnjYXY5W9qrHerNyCK0pcA@mail.gmail.com>
To: Santhana Bharathi <santa@ti.com>
Cc: srk@ti.com, grygorii.strashko@ti.com, badri@ti.com, prasad.jondhale@ti.com,
	nsekhar@ti.com, meta-ti@yoctoproject.org
Subject: Re: [thud][PATCH V1] cpsw9g-eth-fw: update ethernet firmware
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
X-List-Received-Date: Mon, 21 Oct 2019 21:31:08 -0000
Content-Type: text/plain; charset="UTF-8"

I am getting this error

Cloning into bare repository
'TOPDIR/downloads/git2/git.ti.com.glsdk.ti-eth-fw.git'...
fatal: unable to connect to git.ti.com:
git.ti.com[0: 198.47.28.207]: errno=Connection refused


ERROR: Fetcher failure for URL:
'git://git.ti.com/glsdk/ti-eth-fw.git;protocol=git;branch=master'.
Unable to fetch URL from any source.

On Wed, Oct 16, 2019 at 11:41 AM Santhana Bharathi <santa@ti.com> wrote:
>
>  * Updated Ethernet firmware binary for 1.0 release
>
> Signed-off-by: Santhana Bharathi <santa@ti.com>
> ---
>  recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> index a521edf..5598e42 100644
> --- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> +++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> @@ -11,7 +11,7 @@ inherit update-alternatives
>
>  PROTOCOL = "git"
>  BRANCH = "master"
> -SRCREV = "7f3af9b0b4c04edcb68c49cb64fcf0d65a860457"
> +SRCREV = "792c06d9a0f2b9d4b150bce4651bdaae2413b28d"
>
>  SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

