Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2133E00BA2; Sat, 13 Oct 2018 01:17:39 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F5A3E00A0C
	for <meta-ti@yoctoproject.org>; Sat, 13 Oct 2018 01:17:39 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id u34-v6so16379936qth.3
	for <meta-ti@yoctoproject.org>; Sat, 13 Oct 2018 01:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hSALQLJA5v+b341Igj9xA1WfUJVXB3HKO4Zw9xfjpzs=;
	b=SlpWXR5pC/V5sLmSDuxO6TkBXd8NQWz2D5Kjd22za6DIo3GgH3m8nDrkg1ndh146hO
	kA2mc6AhkJM1UfUDFuejOb5Q+UNjjRPXvIMP25I4W8V2kbHDg9sqw+b9vFyuZFRNBvZT
	ltnAovsRMK1kwgjcaejsKdahCGdwa83xw+f4X3Tb31UeL0ieKel1MxoHRj4l1Uk5W4oo
	BdYxguJHi5Bsgj+mfRjdaCM378zIIgEVB9qb0h55ceECkBhBuc0l7eA/22JzVzHVLUfM
	b36rkiuv/7gipNK+r0thFxtS4nY7mbR6M4ie/k5XDcuJ7QTcn6FFywoyb0Jr3fNU4gmr
	AxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hSALQLJA5v+b341Igj9xA1WfUJVXB3HKO4Zw9xfjpzs=;
	b=boV6b1AhUqYQqZH1qbA7AhXU+cDJNMKbvAkcNHrfCjUgaqbepST0P9BVF9dn5+y0r5
	hwGPlpRzhQDM4L1P/wJa8ABMgRuQs09v5kYIojAlHRii7nqK1DwMYx/VMK9ZFEMSs6y5
	Snkt5iYGzaglYjsPvdJicayzklrKp2TPwz99hHnG8PIot9LfLSAmUmDTD29yZZbK05wD
	820JJhLgAkf6H2GYARuY7NGz32fIo+eTGajwVXxCoWyJlFBIZFcuO0m83qe1KHOj63xs
	4zMx1YFGJXtDyCXyn34miN+jMocMUnU9iLYxfQgt4I4SeWu/QARiRihAVfFy6nBfwRqq
	f8Yw==
X-Gm-Message-State: ABuFfohcQL72fntHczaNh+2CJymyonUwsi/0bF0JhO2DBkfAmDVJBUOm
	SyYbsOri+YD6H5f3Tcz1SVVbHOwCy2vbXt8e+FALVwYZ
X-Google-Smtp-Source: ACcGV6322T+bBpILK9dvUVA5tdbe88yahiIDYEGortq9uHbjDOoM81MyzwM/V+dtKz+ktNig5P6509O07xmqDk9fknE=
X-Received: by 2002:ac8:689a:: with SMTP id
	m26-v6mr8485211qtq.254.1539418658368; 
	Sat, 13 Oct 2018 01:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <1539399036-6199-1-git-send-email-denys@ti.com>
In-Reply-To: <1539399036-6199-1-git-send-email-denys@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 13 Oct 2018 01:17:12 -0700
Message-ID: <CAMKF1soZ5HFiWKDrk5jcYG1NihHaSMqmpJXMxCH9b-cKyKra7w@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] beaglebone.conf: temporarily use generic am335x_evm_config for U-boot
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
X-List-Received-Date: Sat, 13 Oct 2018 08:17:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> There have been reports recently that am335x_beaglebone_config generates bad SPL.
> Until that is debugged and fixed, use generic am335x_evm_config that covers all
> AM335x platforms, including BeagleBone variants.
>

it fails to link

| arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not
fit in region `.sram'
| arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
| make[2]: *** [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueabi/u-boot-ti-staging/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.spl:349:
spl/u-boot-spl] Error 1
|

> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  conf/machine/beaglebone.conf | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> index 49edfd6..2514792 100644
> --- a/conf/machine/beaglebone.conf
> +++ b/conf/machine/beaglebone.conf
> @@ -13,7 +13,8 @@ MACHINE_GUI_CLASS = "bigscreen"
>
>  SERIAL_CONSOLE = "115200 ttyS0"
>
> -UBOOT_MACHINE = "am335x_boneblack_config"
> +# fall back on generic am335x_evm_config for now
> +#UBOOT_MACHINE = "am335x_boneblack_config"
>
>  WKS_FILE = "sdimage-bootpart.wks"
>  IMAGE_BOOT_FILES = "MLO u-boot.img"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

