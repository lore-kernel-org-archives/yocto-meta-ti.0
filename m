Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.1014.1575486136223569797
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Dec 2019 11:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fsROuAUU;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-stiffler@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4J2FQG018661;
	Wed, 4 Dec 2019 13:02:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575486135;
	bh=peHoDkcYhXIdIxVAMpuLPhk0s5ffDiopiLSRAPZd/Pk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=fsROuAUUzxjHu+NpDtvilhgESONoMU0VHcmlYmODGwZvIYd77ZuZFX18EhfMuDERy
	 gtq1HT27mMJwiuIKYYKERtPO95F0T+z5cSFbnGnNxy1QQdyDNJrGmUw7HrscQoY5aI
	 ZvuVkx5HVQph8VIKTfKGBG5y+gJ7aIShBo2LWN9U=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4J2FJ8108210;
	Wed, 4 Dec 2019 13:02:15 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 13:02:14 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 13:02:14 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4J2E0P015234;
	Wed, 4 Dec 2019 13:02:14 -0600
Subject: Re: [EXTERNAL] [meta-ti] [master/thud][PATCH v2 01/42] ti-pdk-fetch: add class for common pdk sources
To: <meta-ti@yoctoproject.org>
CC: <meta-ti@lists.yoctoproject.org>, Khem Raj <raj.khem@gmail.com>,
        Denys
 Dmytriyenko <denys@ti.com>
References: <15DCA3475EF6B6AA.2688@lists.yoctoproject.org>
From: "Jacob Stiffler" <j-stiffler@ti.com>
Message-ID: <9b8c1160-9f7a-4d5b-9389-918388aac595@ti.com>
Date: Wed, 4 Dec 2019 14:02:13 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <15DCA3475EF6B6AA.2688@lists.yoctoproject.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------E5584E2A4D865EAD71096FAF"
Content-Language: en-US

--------------E5584E2A4D865EAD71096FAF
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Any further comments on this updated approach?


On 12/2/2019 1:45 PM, Jacob Stiffler via Lists.Yoctoproject.Org wrote:
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
>   classes/ti-pdk-fetch.bbclass                   | 43 ++++++++++++++++++++++++++
>   recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb | 33 ++++++++++++++++++++
>   2 files changed, 76 insertions(+)
>   create mode 100644 classes/ti-pdk-fetch.bbclass
>   create mode 100644 recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb
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
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#12539): https://lists.yoctoproject.org/g/meta-ti/message/12539
> Mute This Topic: https://lists.yoctoproject.org/mt/65159993/3619770
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [j-stiffler@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-

--------------E5584E2A4D865EAD71096FAF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Any further comments on this updated approach?</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/2/2019 1:45 PM, Jacob Stiffler
      via Lists.Yoctoproject.Org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:15DCA3475EF6B6AA.2688@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">Recently individual components and LLD sources have been combined
into a single PDK repo. Use this class to specify the common source.
Also use this class to keep the sources separate from each other when
building. This keeps the build identical to previous recipes while
keeping control on interdependencies.

Similar to gcc-source, use the ti-pdk-source recipe to unpack the
sources into a "work-shared" area. Then hard-link only the necessary
files into a recipe's WORKDIR.

Signed-off-by: Jacob Stiffler <a class="moz-txt-link-rfc2396E" href="mailto:j-stiffler@ti.com">&lt;j-stiffler@ti.com&gt;</a>
---
v2 changes:

To be more efficient, use ti-pdk-source to unpack sources once to a
common "work-shared" area. Then each recipe will hard-link only the
necessary sources. Follow the example set by gcc-source in oe-core.

 classes/ti-pdk-fetch.bbclass                   | 43 ++++++++++++++++++++++++++
 recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb | 33 ++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 classes/ti-pdk-fetch.bbclass
 create mode 100644 recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
new file mode 100644
index 0000000..d845ccc
--- /dev/null
+++ b/classes/ti-pdk-fetch.bbclass
@@ -0,0 +1,43 @@
+TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
+TI_PDK_GIT_BRANCH ?= "master"
+TI_PDK_GIT_PROTOCOL ?= "git"
+TI_PDK_SRCREV ?= "a1d6fab78b8c9e9dcaec5bd6df54af8d196a901a"
+
+TI_PDK_VERSION ?= "2019.11.0"
+
+PV = "${TI_PDK_VERSION}"
+
+TI_PDK_COMP ?= ""
+TI_PDK_COMP_PATH = <a class="moz-txt-link-rfc2396E" href="mailto:${@'${TI_PDK_COMP}'.replace('.','/')}">"${@'${TI_PDK_COMP}'.replace('.','/')}"</a>
+
+TI_PDK_SOURCE_PN = "ti-pdk-source"
+TI_PDK_SOURCE_WORKDIR = "${TMPDIR}/work-shared/ti-pdk-${PV}"
+TI_PDK_SOURCE = "${TI_PDK_SOURCE_WORKDIR}/git"
+
+S = "${WORKDIR}/git/${TI_PDK_COMP_PATH}"
+
+# Hard-link only required sources from PDK
+python do_unpack_append() {
+    if len(d.getVar('TI_PDK_COMP') or '') &gt; 0:
+        import shutil
+
+        # Get src/dst paths
+        src = os.path.join(d.getVar('TI_PDK_SOURCE'),'packages',d.getVar('TI_PDK_COMP_PATH'))
+        s = d.getVar('S')
+
+        # Set up the directory structure, except for the root of the sources
+        # hard-linked.
+        bb.utils.mkdirhier(s)
+        os.rmdir(s)
+
+        # Recursively hard-link the sources
+        shutil.copytree(src, s, copy_function=os.link)
+}
+
+# Make sure that ti-pdk-source is unpacked before we set up the hardlinks.
+python __anonymous () {
+    pn = d.getVar('PN')
+    pdk_src_pn = d.getVar('TI_PDK_SOURCE_PN')
+    if pn != pdk_src_pn:
+        d.appendVarFlag('do_unpack', 'depends', ' ${TI_PDK_SOURCE_PN}:do_unpack')
+}
diff --git a/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb b/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb
new file mode 100644
index 0000000..f4b3da9
--- /dev/null
+++ b/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb
@@ -0,0 +1,33 @@
+# Recipe to fetch/unpack sources used by ti-pdk-fetch recipes.
+#
+# Mimic gcc-source.inc from oe-core.
+
+# These shources will be unpacked to a "work-shared" directory. Then each
+# "ti-pdk-fetch" recipe will hard-link only the sources it requires.
+
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot
+deltask do_populate_lic
+
+RM_WORK_EXCLUDE += "${PN}"
+EXCLUDE_FROM_WORLD = "1"
+
+inherit nopackages ti-pdk-fetch
+
+LICENSE = "BSD-3-Clause"
+
+PN = "${TI_PDK_SOURCE_PN}"
+WORKDIR = "${TI_PDK_SOURCE_WORKDIR}"
+SSTATE_SWSPEC = "sstate:ti-pdk::${PV}:${PR}::${SSTATE_VERSION}:"
+
+STAMP = "${STAMPS_DIR}/work-shared/ti-pdk-${PV}"
+STAMPCLEAN = "${STAMPS_DIR}/work-shared/ti-pdk-${PV}*"
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS = ""
+PACKAGES = ""
+
+SRC_URI = "${TI_PDK_GIT_URI};branch=${TI_PDK_GIT_BRANCH};protocol=${TI_PDK_GIT_PROTOCOL}"
+SRCREV = "${TI_PDK_SRCREV}"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.

View/Reply Online (#12539): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-ti/message/12539">https://lists.yoctoproject.org/g/meta-ti/message/12539</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/65159993/3619770">https://lists.yoctoproject.org/mt/65159993/3619770</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-ti+owner@lists.yoctoproject.org">meta-ti+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-ti/unsub">https://lists.yoctoproject.org/g/meta-ti/unsub</a>  [<a class="moz-txt-link-abbreviated" href="mailto:j-stiffler@ti.com">j-stiffler@ti.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-
</pre>
    </blockquote>
  </body>
</html>

--------------E5584E2A4D865EAD71096FAF--
