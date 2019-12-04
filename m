Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web09.1131.1575486647468577984
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Dec 2019 11:10:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f5OzC0DH;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id a10so1003190qko.9
        for <meta-ti@lists.yoctoproject.org>; Wed, 04 Dec 2019 11:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TT2HIxrDehYmATqnRiMErw/v56Uv+OnsE/pVpTLSMlo=;
        b=f5OzC0DHuLuRcsYNDu4b840X33/Il9WJFpEqd23TxrIBt+YmB2aQCmYwWFnqqUY/dF
         FsMwsKMdf8ginpCK2YStdxRYLYpG2EporVlG0h1gxFvPS9RvzROpp1vqcIl2LGVFC84a
         TKYFlXxGzgIlISzrgYfBSPckOCwjKqhnXfHgCwfuKKlbvY7Ld/9GhEcTilkrcZpC1m6Y
         a1VW+UEYsSiVLylkUQQ4rgNggMYWr3gJerbavht4O+i0GpeMn9cY10B2pIxr/105cv2/
         Jx0U3m3I4CpDxkfZ6WZkOGTEWP035J/YOwPYnvGfMUmREqGbd8jgczGliLPpQZFWKeJj
         STxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TT2HIxrDehYmATqnRiMErw/v56Uv+OnsE/pVpTLSMlo=;
        b=bUxlRHapF1ZYiaIGT7tb2Jq9cNwwedRdBNI96NwMiZyL2JkYTV49l39bdPaUha28o1
         M0ebDQUxAYeBttMn77Dt17FQXnKr8IMEkFWghHuUUj7pfLMl5SVpcOFa7Mb1Mo6xPuln
         DeeY2B8CKQa/FneuMCU8mTqSP2Htp+grtQLpC6xfyLgeYJi16Tl1/6znEDy+nc4x9xHZ
         7Bw2vnfWaXx6ffERRB8fgTVfCSN+paXKOjAZ0whr8HAfHFvnhPbuBI/JqkmV0D88bYJl
         n76gDX0sHzubA1NAsfWWO0FOqHijqMWa9AZiLwqPqp4ItNlGdriV0z5FeEEjga7+NNKI
         j1SQ==
X-Gm-Message-State: APjAAAWaIXfj0+NBfDaVkQTZsgdnRvzw+q9pSwaIdd8N+1dwK06cieFw
	yA7kUFpLqvkN2+ryWrqFpgCjTDC2ry7tLwxmaTQ=
X-Google-Smtp-Source: APXvYqxhTL4vuFbKMZuET2/96+zlcT1P7MyRacXRgn8qbV5hsfATjs1gqQ7NGU1yEG5LNiWNVYAOsV35kcyelGtiVdY=
X-Received: by 2002:a37:4cd3:: with SMTP id z202mr4844644qka.212.1575486646209;
 Wed, 04 Dec 2019 11:10:46 -0800 (PST)
MIME-Version: 1.0
References: <15DCA3475EF6B6AA.2688@lists.yoctoproject.org> <9b8c1160-9f7a-4d5b-9389-918388aac595@ti.com>
In-Reply-To: <9b8c1160-9f7a-4d5b-9389-918388aac595@ti.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 4 Dec 2019 11:10:19 -0800
Message-ID: <CAMKF1srzw-pwLHvGAso6joHwX_ELrDfkyKBo0N8Mz6jAHgPWwQ@mail.gmail.com>
Subject: Re: [EXTERNAL] [meta-ti] [master/thud][PATCH v2 01/42] ti-pdk-fetch: add class for common pdk sources
To: Jacob Stiffler <j-stiffler@ti.com>
Cc: meta-ti@yoctoproject.org, meta-ti@lists.yoctoproject.org, 
	Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

Thanks Jacob, this looks good to me.

On Wed, Dec 4, 2019 at 11:02 AM Jacob Stiffler <j-stiffler@ti.com> wrote:
>
> Any further comments on this updated approach?
>
>
> On 12/2/2019 1:45 PM, Jacob Stiffler via Lists.Yoctoproject.Org wrote:
>
> Recently individual components and LLD sources have been combined
> into a single PDK repo. Use this class to specify the common source.
> Also use this class to keep the sources separate from each other when
> building. This keeps the build identical to previous recipes while
> keeping control on interdependencies.
>
> Similar to gcc-source, use the ti-pdk-source recipe to unpack the
> sources into a "work-shared" area. Then hard-link only the necessary
> files into a recipe's WORKDIR.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> v2 changes:
>
> To be more efficient, use ti-pdk-source to unpack sources once to a
> common "work-shared" area. Then each recipe will hard-link only the
> necessary sources. Follow the example set by gcc-source in oe-core.
>
>  classes/ti-pdk-fetch.bbclass                   | 43 ++++++++++++++++++++++++++
>  recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb | 33 ++++++++++++++++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644 classes/ti-pdk-fetch.bbclass
>  create mode 100644 recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb
>
> diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
> new file mode 100644
> index 0000000..d845ccc
> --- /dev/null
> +++ b/classes/ti-pdk-fetch.bbclass
> @@ -0,0 +1,43 @@
> +TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
> +TI_PDK_GIT_BRANCH ?= "master"
> +TI_PDK_GIT_PROTOCOL ?= "git"
> +TI_PDK_SRCREV ?= "a1d6fab78b8c9e9dcaec5bd6df54af8d196a901a"
> +
> +TI_PDK_VERSION ?= "2019.11.0"
> +
> +PV = "${TI_PDK_VERSION}"
> +
> +TI_PDK_COMP ?= ""
> +TI_PDK_COMP_PATH = "${@'${TI_PDK_COMP}'.replace('.','/')}"
> +
> +TI_PDK_SOURCE_PN = "ti-pdk-source"
> +TI_PDK_SOURCE_WORKDIR = "${TMPDIR}/work-shared/ti-pdk-${PV}"
> +TI_PDK_SOURCE = "${TI_PDK_SOURCE_WORKDIR}/git"
> +
> +S = "${WORKDIR}/git/${TI_PDK_COMP_PATH}"
> +
> +# Hard-link only required sources from PDK
> +python do_unpack_append() {
> +    if len(d.getVar('TI_PDK_COMP') or '') > 0:
> +        import shutil
> +
> +        # Get src/dst paths
> +        src = os.path.join(d.getVar('TI_PDK_SOURCE'),'packages',d.getVar('TI_PDK_COMP_PATH'))
> +        s = d.getVar('S')
> +
> +        # Set up the directory structure, except for the root of the sources
> +        # hard-linked.
> +        bb.utils.mkdirhier(s)
> +        os.rmdir(s)
> +
> +        # Recursively hard-link the sources
> +        shutil.copytree(src, s, copy_function=os.link)
> +}
> +
> +# Make sure that ti-pdk-source is unpacked before we set up the hardlinks.
> +python __anonymous () {
> +    pn = d.getVar('PN')
> +    pdk_src_pn = d.getVar('TI_PDK_SOURCE_PN')
> +    if pn != pdk_src_pn:
> +        d.appendVarFlag('do_unpack', 'depends', ' ${TI_PDK_SOURCE_PN}:do_unpack')
> +}
> diff --git a/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb b/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb
> new file mode 100644
> index 0000000..f4b3da9
> --- /dev/null
> +++ b/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb
> @@ -0,0 +1,33 @@
> +# Recipe to fetch/unpack sources used by ti-pdk-fetch recipes.
> +#
> +# Mimic gcc-source.inc from oe-core.
> +
> +# These shources will be unpacked to a "work-shared" directory. Then each
> +# "ti-pdk-fetch" recipe will hard-link only the sources it requires.
> +
> +deltask do_configure
> +deltask do_compile
> +deltask do_install
> +deltask do_populate_sysroot
> +deltask do_populate_lic
> +
> +RM_WORK_EXCLUDE += "${PN}"
> +EXCLUDE_FROM_WORLD = "1"
> +
> +inherit nopackages ti-pdk-fetch
> +
> +LICENSE = "BSD-3-Clause"
> +
> +PN = "${TI_PDK_SOURCE_PN}"
> +WORKDIR = "${TI_PDK_SOURCE_WORKDIR}"
> +SSTATE_SWSPEC = "sstate:ti-pdk::${PV}:${PR}::${SSTATE_VERSION}:"
> +
> +STAMP = "${STAMPS_DIR}/work-shared/ti-pdk-${PV}"
> +STAMPCLEAN = "${STAMPS_DIR}/work-shared/ti-pdk-${PV}*"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +DEPENDS = ""
> +PACKAGES = ""
> +
> +SRC_URI = "${TI_PDK_GIT_URI};branch=${TI_PDK_GIT_BRANCH};protocol=${TI_PDK_GIT_PROTOCOL}"
> +SRCREV = "${TI_PDK_SRCREV}"
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#12539): https://lists.yoctoproject.org/g/meta-ti/message/12539
> Mute This Topic: https://lists.yoctoproject.org/mt/65159993/3619770
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [j-stiffler@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
