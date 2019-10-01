Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6BCF4E00D4E; Mon, 30 Sep 2019 23:42:12 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.160.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AAB3AE00D33
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 23:42:11 -0700 (PDT)
Received: by mail-qt1-f193.google.com with SMTP id n1so20229279qtp.8
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 23:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CQLSscB8NG86gyNbQu8CDTCG3P5KtY+lejMO8sHzSSw=;
	b=gx5n/Qi8pM2nvH+ihkUxL1KpP1Nd4sUKyfCsdb0IRvFLV9A45NFiFlKCcxiGcGAZON
	ihwK4xidZfoMQBvDRPWXDQMNaKxStW6+sq2AGfivMLYP+C8m+Hp2r9QT6TOk0hFSWLzc
	rzIa/0mfxDnwc6RGiVviCFBBmI3T33UdvL9i0KvSGUU1YK+5Z60gfBz5nETBkBVCqfP7
	b4oa4OwY4ANDwSFRnFfxe5IT2035sFl6a4Fv2GvRBgHOZs1TabPXY89e2O7Xiihl5YkE
	ly0st8II5qtIu9gcBidU2OavqlSwnpOONJsL1LKcYifK/tOIPnpVpIcY2tgU42HlJydJ
	T2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CQLSscB8NG86gyNbQu8CDTCG3P5KtY+lejMO8sHzSSw=;
	b=YRqQGJu6MBIcGbH/kXekzAaeKMu5Tm6yxxBOr0SeP+y4Yccx1eL9V8UVpyDI4P6Y5J
	BUqcSB2mjZp+QhdO7Q1RX3P5vKCht4mieN5HiQzevtlwLnATRBHyC94I/9S0FnUz6Dic
	1MAiPQaX1Oukjw9LVfO1FMWi+OIt6cwgfEBwKphcXEJYJijsVb+BeQEc5qXAfknARTg4
	B4KYZGROWn3gJ89MFLRgTk3+D9yeToF/LwJOpj1kpWV7LwfdWcsT0x16MsbGAD5x72rU
	VClYKpwYNtL52khQYrOf4JeNb6eRrtU8XyOsx04FuxhIbhBBYfK/pOdYz6kDYzQ/hJht
	/jRg==
X-Gm-Message-State: APjAAAUAOkAIKT6pmfpmMoSR0Maaj+d61ltm+hd98bfSAGtWwg6m+KiJ
	NyrfTx+QiJVIZwyJyRN89/O2MVJEdmACWcir5vs=
X-Google-Smtp-Source: APXvYqzEAtOTsLao0Wxm0iF1ld4aCPF1eVDgmQkMfjKyO0u9LBdXvcPid5E66NpcASQgMG401SQEY9DJ/mbWwxv+XkQ=
X-Received: by 2002:ac8:e09:: with SMTP id a9mr28867037qti.88.1569912130803;
	Mon, 30 Sep 2019 23:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <1569575804-36910-1-git-send-email-nikhil.nd@ti.com>
In-Reply-To: <1569575804-36910-1-git-send-email-nikhil.nd@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Sep 2019 23:41:43 -0700
Message-ID: <CAMKF1soPvCo8VKJu10P1fvjA_iJjeskJ59wyyNBTCt8LxvRxTQ@mail.gmail.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master PATCH v2] recipes-bsp: ivshmem-uio: Add new recipe for ivshmem-uio driver
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
X-List-Received-Date: Tue, 01 Oct 2019 06:42:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 27, 2019 at 2:17 AM Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
>
> This is external kernel module which enables userspace io over the
> Jailhouse ivhsmem (inter VM shared memory)
> This driver is useful to test the inter VM communication.
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
> Changes from v1:
> * Split the ivshmem recipe separately
> * Add summary and remove PACKAGE_ARCH define
>
>  recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb | 27 +++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
>
> diff --git a/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> new file mode 100644
> index 0000000..33fb946
> --- /dev/null
> +++ b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION =  "Kernel driver for IVSHMEM based UIO driver"
> +SUMMARY = "Kernel module which registers a UIO (userspace io) device for inter VM shared memory"
> +HOMEPAGE = "https://github.com/henning-schild-work/ivshmem-guest-code"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=0546a27aad86c83b75ad4ee6133e9d5e"
> +
> +inherit module
> +
> +RDEPENDS_${PN} = "jailhouse"
> +

jailhouse is marked as ti-soc specific, so please mark this recipe
ti-soc specific as well. It will help meta-ti to live in a multi-BSP
distros

http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86-64/1164/consoleFull

if you could test meta-ti patches with one non-ti machine like qemux86
or some such it will help catch this kind of errors


> +PROTOCOL = "git"
> +BRANCH = "jailhouse"
> +SRCREV = "f3ad79881bebb6c6068966ee3d265d8034c20492"
> +SRC_URI = "git://github.com/henning-schild-work/ivshmem-guest-code.git;protocol=${PROTOCOL};branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE += 'KDIR="${STAGING_KERNEL_DIR}"'
> +
> +do_compile_prepend() {
> +    cd ${S}/kernel_module/uio
> +}
> +
> +do_install() {
> +    install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> +    install -m 644 ${S}/kernel_module/uio/uio_ivshmem.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
> +}
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

