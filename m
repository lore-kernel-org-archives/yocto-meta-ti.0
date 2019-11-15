Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B860E00D9D; Fri, 15 Nov 2019 09:14:22 -0800 (PST)
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
	*      [209.85.214.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F140AE0049C
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:14:21 -0800 (PST)
Received: by mail-pl1-f196.google.com with SMTP id ay6so5091192plb.0
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:user-agent:mime-version:content-transfer-encoding;
	bh=q8SBnZqFHbVFSQfQIZuoxHF7J2XlE885dKG43E2MAYw=;
	b=oSrp4hBiTUeNNn3sgUvVPvwl3WUfb8wkdYRij1XPUV1w+ocztJjJeWT7FURd/1M2f8
	amK7GP2zmHhAIkki8dSke+lau61JeeCOUybV0mfDJq67AuXSMozT/f4JGzgwH5VylQ83
	PBY8Z4A3ERwQgnz1DM7PZZ4HmSWXqHC9doX8Q6HwRfbCaziq3pZwTIa0jd/DlavJV6Cg
	JFFhYRGGxXFtLPevVvf3hDZ6OPYx4JdaE+obQcVGYo/UtRgfrn6fnSELgcH0WLNsl9PW
	A6A73RtxsZMbKk2KMrqs1wDADzKTL16LXTeLpJsELYgdLdI3ySJ6IYuOE7sLWXFdv56r
	JBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=q8SBnZqFHbVFSQfQIZuoxHF7J2XlE885dKG43E2MAYw=;
	b=iST9SHdY60kEs7lzgaa7Iq0/uBGhhqON3rM2Y78eylWAyTpVGkFRmv5zajM5QH/rva
	q4jJ/Rg9GU+ztBA4c5zfMHpQ7XQpQHZA6BEfCnSol32AiB1WWWKTclSTQlbHs008Yho8
	gSEUfyJdoVUMnz/oRJusqg4CV9412mZkKjwxEsN/mWrkFApMoVDJnJq1MZqn8D+9295B
	VFtWQjJynjTDuAlno5TZkKZgsORdwmd2tSCauJETJayyaCrrtz3Ur29DABv55Y436iWh
	MSFRJtJ6UeuOhRH3lB+3EhCnQjMOFk2olSPzZdfzsAhCIGF299flzQOw8eoUnUmYGPGt
	N+lQ==
X-Gm-Message-State: APjAAAW1t3z5k8nZYMLhyQFCiJer7JxBwq8ZrvO0f6td2p03H89zZKeK
	iYl4fSkPchI0iU9qmioGNRs=
X-Google-Smtp-Source: APXvYqwHcC2iMSDNDbWUrxYLxnoiOCXZynOr+YyIpksRn4v7kO6N11RD/h/BTw0tWTPX7pmxHbbcJA==
X-Received: by 2002:a17:902:fe0f:: with SMTP id
	g15mr16351243plj.198.1573838061045; 
	Fri, 15 Nov 2019 09:14:21 -0800 (PST)
Received: from apollo ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	e17sm13533936pgt.89.2019.11.15.09.14.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Nov 2019 09:14:20 -0800 (PST)
Message-ID: <17d4428990ced5db9ea54f695950c868bd7a50cd.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Jacob Stiffler <j-stiffler@ti.com>, meta-ti@yoctoproject.org
Date: Fri, 15 Nov 2019 09:14:15 -0800
In-Reply-To: <1573830902-17409-2-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
	<1573830902-17409-2-git-send-email-j-stiffler@ti.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Subject: Re: [master/thud][PATCH 01/42] ti-pdk-fetch: add class for common pdk sources
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
X-List-Received-Date: Fri, 15 Nov 2019 17:14:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-11-15 at 10:14 -0500, Jacob Stiffler wrote:
> Recently individual components and LLD sources have been combined
> into a single PDK repo. Use this class to specify the common source.
> Also use this class to keep the sources separate from each other when
> building. This keeps the build identical to previous recipes while
> keeping control on interdependencies.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  classes/ti-pdk-fetch.bbclass | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 classes/ti-pdk-fetch.bbclass
> 
> diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-
> fetch.bbclass
> new file mode 100644
> index 0000000..6e36e3b
> --- /dev/null
> +++ b/classes/ti-pdk-fetch.bbclass
> @@ -0,0 +1,31 @@
> +TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
> +TI_PDK_GIT_BRANCH ?= "master"
> +TI_PDK_GIT_PROTOCOL ?= "git"
> +TI_PDK_SRCREV ?= "a609fa636c4d899e5dd3d7a89a1c070b854849b0"
> +
> +TI_PDK_VERSION ?= "2019.11.0+git${SRCPV}"
> +
> +TI_PDK_SRC = "_tmp_pdk"
> +SRC_URI =
> "${TI_PDK_GIT_URI};branch=${TI_PDK_GIT_BRANCH};protocol=${TI_PDK_GIT_
> PROTOCOL};destsuffix=${TI_PDK_SRC}"
> +SRCREV = "${TI_PDK_SRCREV}"
> +
> +PV = "${TI_PDK_VERSION}"
> +
> +TI_PDK_COMP ?= ""
> +TI_PDK_COMP_PATH = "${@'${TI_PDK_COMP}'.replace('.','/')}"
> +
> +S = "${WORKDIR}/git/${TI_PDK_COMP_PATH}"
> +
> +# Extract only required sources from PDK
> +python do_unpack_append() {
> +    if len(d.getVar('TI_PDK_COMP') or '') > 0:
> +        import subprocess
> +
> +        src =
> os.path.join(d.getVar('TI_PDK_SRC'),'packages',d.getVar('TI_PDK_COMP_
> PATH'))
> +
> +        # Package up only the required sources
> +        cmd = 'tar -cf - -C %s -p -S . | tar -xf - -C %s' % (src,
> d.getVar('S'))
> +        subprocess.check_output(cmd, shell=True,
> stderr=subprocess.STDOUT)
> +
> +        bb.utils.remove(d.getVar('TI_PDK_SRC'), recurse=True)
> +}

perhaps looking in work-shared idea from kernel or gcc or clang
packages could make it better where, you only untar sources once

> -- 
> 2.7.4
> 


