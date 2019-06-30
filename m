Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E44A7E00C78; Sat, 29 Jun 2019 20:58:42 -0700 (PDT)
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
	*      [209.85.222.194 listed in list.dnswl.org]
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4F82E008E3
	for <meta-ti@yoctoproject.org>; Sat, 29 Jun 2019 20:58:41 -0700 (PDT)
Received: by mail-qk1-f194.google.com with SMTP id i125so8401715qkd.6
	for <meta-ti@yoctoproject.org>; Sat, 29 Jun 2019 20:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iACU2jRxOkgYkdpHtdC74loduIovv90YIILb6shwrxQ=;
	b=A39o7eYcc0El9xZlg//88Eu6JhjwN2DTUrnZcMfr7n3Kp19oIgYoH8PF66mJTVbLwt
	Mb93QKxPtXOWfl8Ay5UiVYMx6hZNBEME8yUp/YQSm9ocLURrtZOubStcLtlDDA6+vFnB
	8IU+2dhIc3Ib5HFc1RMRME8S65EO5LJz3HuvOjvUspVs3NgFh/7qqCjvogS41vrI136a
	w4oWOKU6JT0VljtC/DKM2JylXLJH5ob7urntoMJdgsdxHYYkL7vEsfGlEu0/mE+iGsvg
	uvrSZdyf4swvGUJHz+DX9zKs8gCeuHU200xw3aW5iaPj4gjvdUYAUISDKw0J84aHg/7m
	3fKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iACU2jRxOkgYkdpHtdC74loduIovv90YIILb6shwrxQ=;
	b=lGBaZZNO0tgkpXBJZ1mBtdPyWkWxfVwIU7UxV+ZDN0aEYnbYJRgTSVD6VEcqbaLP4R
	QeIv3MdTGFWYW1/8z8CcMmza3vzuUa9lG0oL7vX8yqHmBxPg9i52TeGv50COxCqMtSFc
	DJCR2iEJ3x4r445+cJ/sbSUuB/6LKW2xJWrfIOAZc1aEMnowSaOft3Nncv8ZFL072RnX
	IXmVRWfbpIbqaJjFwEVofg/3/ds5vXhx7GYJRV6SFyivTNeNgQnrDRSXrEuT1FSoXNjK
	I0w3O0hdv+x3X3SwHTZY+8QWiu7zlg9mQLq07Fr4g4oITDkz6vSLl/i+U0rl4z7uXsef
	uX1g==
X-Gm-Message-State: APjAAAUwkNXVXELu8SbkNXMJkB79b4uoKaxoPBeetDmUm1xPkjm3vPVU
	lGEPDcFNa4nnWBFqq+n5mch6cKXyuh/JQhIeLB5WnkE9
X-Google-Smtp-Source: APXvYqzpyl+440VNHdRLzu1oYM7RlQMDLLPAKjQwqlqxP5lMLBNBCiv6ZZt1YueOUHnBRhOdCRdz6mRKA/+d36gsPG0=
X-Received: by 2002:a37:c81:: with SMTP id 123mr12803351qkm.474.1561867120510; 
	Sat, 29 Jun 2019 20:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <1561070165-5304-1-git-send-email-angelabaker@ti.com>
In-Reply-To: <1561070165-5304-1-git-send-email-angelabaker@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Jun 2019 23:58:14 -0400
Message-ID: <CAMKF1spFVokBHW+MQzo11wbCzxVMafTr+MhFDu-0biRQdmE-zA@mail.gmail.com>
To: Angela Stegmaier <angelabaker@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud][PATCH] ti-img-encode-decode: Add the ti-img-encode-decode recipe
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
X-List-Received-Date: Sun, 30 Jun 2019 03:58:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 20, 2019 at 6:37 PM Angela Stegmaier <angelabaker@ti.com> wrote:
>
> Add the recipe for the video decoder driver.
>

this should be marked with TI specific COMPATIBLE_MACHINE as well.
Since it might not work well in a multi-BSP environment

> Signed-off-by: David Huang <d-huang@ti.com>
> Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> ---
>
> Note: This recipe depends on the linux kernel having the patches from the
> multimedia feature tree merged.
>
>
>  .../ti-img-encode-decode_1.0.0.bb                  | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
>
> diff --git a/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> new file mode 100644
> index 0000000..65c3b67
> --- /dev/null
> +++ b/recipes-bsp/ti-img-encode-decode/ti-img-encode-decode_1.0.0.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "Kernel drivers for the IMG VXE384 MP2 and D5520 encoder/decoder found in TI SoCs"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://common/dq.c;beginline=1;endline=16;md5=e015e28ff5e88576dab9fdf641e3dbfe"
> +
> +inherit module
> +
> +MACHINE_KERNEL_PR_append = "a"
> +PR = "${MACHINE_KERNEL_PR}"
> +
> +SRCREV = "306e85edce7969a4e017e12759be7ed763fda95c"
> +
> +EXTRA_OEMAKE = "KPATH=${STAGING_KERNEL_DIR} KCONF=${STAGING_KERNEL_BUILDDIR}"
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/jacinto7_multimedia/ti-img-encode-decode.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +       install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> +       install -m 644 ${S}/vxd-dec.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> +}
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

