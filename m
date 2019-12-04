Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.3800.1575497076056529912
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Dec 2019 14:04:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DYtEDeJX;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4M4YgV047514;
	Wed, 4 Dec 2019 16:04:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575497074;
	bh=K3ADnF9YJNsHPEWEWJt5ZxyGwEDc5jdcgEcd6Kw2D70=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=DYtEDeJXiWbOGaLbKFeYMwKjESDjWQZpyDf1IBqHpDhmkeEF/UXx7fPwxKqyzCZsZ
	 yGaRUSdQcQni+etufSPZMQ/BMye7BMqCrnwAKCAya9qxYOKhmmvGXcidXglpitGS/+
	 2pBz9f2AAmL0uC+zs4TKApS/+CkHkeQh0CVtrU5g=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB4M4YBl103459
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Dec 2019 16:04:34 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 16:04:33 -0600
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
 DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%17]) with mapi id
 15.01.1847.003; Wed, 4 Dec 2019 16:04:33 -0600
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
CC: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        Khem Raj
	<raj.khem@gmail.com>
Subject: Re: [EXTERNAL] [meta-ti] [master/thud][PATCH v2 01/42] ti-pdk-fetch: add class for common pdk sources
Thread-Topic: [EXTERNAL] [meta-ti] [master/thud][PATCH v2 01/42] ti-pdk-fetch:
 add class for common pdk sources
Thread-Index: AQHVqtVX/zunEH5Ff0iwIi7cko+Pjqeqh/OZ
Date: Wed, 4 Dec 2019 22:04:33 +0000
Message-ID: <8cf2a7e1-97e4-4e57-86d1-8235e54ae87f@email.android.com>
References: <15DCA3475EF6B6AA.2688@lists.yoctoproject.org>,<9b8c1160-9f7a-4d5b-9389-918388aac595@ti.com>
In-Reply-To: <9b8c1160-9f7a-4d5b-9389-918388aac595@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8cf2a7e197e44e5786d18235e54ae87femailandroidcom_"

--_000_8cf2a7e197e44e5786d18235e54ae87femailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Good with me too, thanks!

Denys

On Dec 4, 2019 14:02, "Stiffler, Jacob" <j-stiffler@ti.com> wrote:

Any further comments on this updated approach?


On 12/2/2019 1:45 PM, Jacob Stiffler via Lists.Yoctoproject.Org wrote:

Recently individual components and LLD sources have been combined
into a single PDK repo. Use this class to specify the common source.
Also use this class to keep the sources separate from each other when
building. This keeps the build identical to previous recipes while
keeping control on interdependencies.

Similar to gcc-source, use the ti-pdk-source recipe to unpack the
sources into a "work-shared" area. Then hard-link only the necessary
files into a recipe's WORKDIR.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com><mailto:j-stiffler@ti.com>
---
v2 changes:

To be more efficient, use ti-pdk-source to unpack sources once to a
common "work-shared" area. Then each recipe will hard-link only the
necessary sources. Follow the example set by gcc-source in oe-core.

 classes/ti-pdk-fetch.bbclass                   | 43 ++++++++++++++++++++++=
++++
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
+TI_PDK_GIT_URI ?=3D "git://git.ti.com/processor-sdk/pdk.git"
+TI_PDK_GIT_BRANCH ?=3D "master"
+TI_PDK_GIT_PROTOCOL ?=3D "git"
+TI_PDK_SRCREV ?=3D "a1d6fab78b8c9e9dcaec5bd6df54af8d196a901a"
+
+TI_PDK_VERSION ?=3D "2019.11.0"
+
+PV =3D "${TI_PDK_VERSION}"
+
+TI_PDK_COMP ?=3D ""
+TI_PDK_COMP_PATH =3D "${@'${TI_PDK_COMP}'.replace('.','/')}"<mailto:${@'${=
TI_PDK_COMP}'.replace('.','/')}>
+
+TI_PDK_SOURCE_PN =3D "ti-pdk-source"
+TI_PDK_SOURCE_WORKDIR =3D "${TMPDIR}/work-shared/ti-pdk-${PV}"
+TI_PDK_SOURCE =3D "${TI_PDK_SOURCE_WORKDIR}/git"
+
+S =3D "${WORKDIR}/git/${TI_PDK_COMP_PATH}"
+
+# Hard-link only required sources from PDK
+python do_unpack_append() {
+    if len(d.getVar('TI_PDK_COMP') or '') > 0:
+        import shutil
+
+        # Get src/dst paths
+        src =3D os.path.join(d.getVar('TI_PDK_SOURCE'),'packages',d.getVar=
('TI_PDK_COMP_PATH'))
+        s =3D d.getVar('S')
+
+        # Set up the directory structure, except for the root of the sourc=
es
+        # hard-linked.
+        bb.utils.mkdirhier(s)
+        os.rmdir(s)
+
+        # Recursively hard-link the sources
+        shutil.copytree(src, s, copy_function=3Dos.link)
+}
+
+# Make sure that ti-pdk-source is unpacked before we set up the hardlinks.
+python __anonymous () {
+    pn =3D d.getVar('PN')
+    pdk_src_pn =3D d.getVar('TI_PDK_SOURCE_PN')
+    if pn !=3D pdk_src_pn:
+        d.appendVarFlag('do_unpack', 'depends', ' ${TI_PDK_SOURCE_PN}:do_u=
npack')
+}
diff --git a/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb b/recipes-bsp/t=
i-pdk-source/ti-pdk-source_git.bb
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
+RM_WORK_EXCLUDE +=3D "${PN}"
+EXCLUDE_FROM_WORLD =3D "1"
+
+inherit nopackages ti-pdk-fetch
+
+LICENSE =3D "BSD-3-Clause"
+
+PN =3D "${TI_PDK_SOURCE_PN}"
+WORKDIR =3D "${TI_PDK_SOURCE_WORKDIR}"
+SSTATE_SWSPEC =3D "sstate:ti-pdk::${PV}:${PR}::${SSTATE_VERSION}:"
+
+STAMP =3D "${STAMPS_DIR}/work-shared/ti-pdk-${PV}"
+STAMPCLEAN =3D "${STAMPS_DIR}/work-shared/ti-pdk-${PV}*"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+DEPENDS =3D ""
+PACKAGES =3D ""
+
+SRC_URI =3D "${TI_PDK_GIT_URI};branch=3D${TI_PDK_GIT_BRANCH};protocol=3D${=
TI_PDK_GIT_PROTOCOL}"
+SRCREV =3D "${TI_PDK_SRCREV}"




-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.

View/Reply Online (#12539): https://lists.yoctoproject.org/g/meta-ti/messag=
e/12539
Mute This Topic: https://lists.yoctoproject.org/mt/65159993/3619770
Group Owner: meta-ti+owner@lists.yoctoproject.org<mailto:meta-ti+owner@list=
s.yoctoproject.org>
Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [j-stiffler@ti=
.com<mailto:j-stiffler@ti.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--_000_8cf2a7e197e44e5786d18235e54ae87femailandroidcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta content=3D"text/html; charset=3Dutf-8">
</head>
<body bgcolor=3D"#FFFFFF">
<div dir=3D"auto">Good with me too, thanks!
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Denys</div>
</div>
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On Dec 4, 2019 14:02, &quot;Stiffler, Jacob&quot=
; &lt;j-stiffler@ti.com&gt; wrote:<br type=3D"attribution">
</div>
</div>
<div>
<p>Any further comments on this updated approach?</p>
<p><br>
</p>
<div class=3D"moz-cite-prefix">On 12/2/2019 1:45 PM, Jacob Stiffler via Lis=
ts.Yoctoproject.Org wrote:<br>
</div>
<blockquote type=3D"cite">
<pre class=3D"moz-quote-pre">Recently individual components and LLD sources=
 have been combined
into a single PDK repo. Use this class to specify the common source.
Also use this class to keep the sources separate from each other when
building. This keeps the build identical to previous recipes while
keeping control on interdependencies.

Similar to gcc-source, use the ti-pdk-source recipe to unpack the
sources into a &quot;work-shared&quot; area. Then hard-link only the necess=
ary
files into a recipe's WORKDIR.

Signed-off-by: Jacob Stiffler <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:j-stiffler@ti.com">&lt;j-stiffler@ti.com&gt;</a>
---
v2 changes:

To be more efficient, use ti-pdk-source to unpack sources once to a
common &quot;work-shared&quot; area. Then each recipe will hard-link only t=
he
necessary sources. Follow the example set by gcc-source in oe-core.

 classes/ti-pdk-fetch.bbclass                   | 43 &#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;
 recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb | 33 &#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;
 2 files changed, 76 insertions(&#43;)
 create mode 100644 classes/ti-pdk-fetch.bbclass
 create mode 100644 recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
new file mode 100644
index 0000000..d845ccc
--- /dev/null
&#43;&#43;&#43; b/classes/ti-pdk-fetch.bbclass
@@ -0,0 &#43;1,43 @@
&#43;TI_PDK_GIT_URI ?=3D &quot;git://git.ti.com/processor-sdk/pdk.git&quot;
&#43;TI_PDK_GIT_BRANCH ?=3D &quot;master&quot;
&#43;TI_PDK_GIT_PROTOCOL ?=3D &quot;git&quot;
&#43;TI_PDK_SRCREV ?=3D &quot;a1d6fab78b8c9e9dcaec5bd6df54af8d196a901a&quot=
;
&#43;
&#43;TI_PDK_VERSION ?=3D &quot;2019.11.0&quot;
&#43;
&#43;PV =3D &quot;${TI_PDK_VERSION}&quot;
&#43;
&#43;TI_PDK_COMP ?=3D &quot;&quot;
&#43;TI_PDK_COMP_PATH =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:${@'${TI_PDK_COMP}'.replace('.','/')}">&quot;${@'${TI_PDK_COMP}'.replace('=
.','/')}&quot;</a>
&#43;
&#43;TI_PDK_SOURCE_PN =3D &quot;ti-pdk-source&quot;
&#43;TI_PDK_SOURCE_WORKDIR =3D &quot;${TMPDIR}/work-shared/ti-pdk-${PV}&quo=
t;
&#43;TI_PDK_SOURCE =3D &quot;${TI_PDK_SOURCE_WORKDIR}/git&quot;
&#43;
&#43;S =3D &quot;${WORKDIR}/git/${TI_PDK_COMP_PATH}&quot;
&#43;
&#43;# Hard-link only required sources from PDK
&#43;python do_unpack_append() {
&#43;    if len(d.getVar('TI_PDK_COMP') or '') &gt; 0:
&#43;        import shutil
&#43;
&#43;        # Get src/dst paths
&#43;        src =3D os.path.join(d.getVar('TI_PDK_SOURCE'),'packages',d.ge=
tVar('TI_PDK_COMP_PATH'))
&#43;        s =3D d.getVar('S')
&#43;
&#43;        # Set up the directory structure, except for the root of the s=
ources
&#43;        # hard-linked.
&#43;        bb.utils.mkdirhier(s)
&#43;        os.rmdir(s)
&#43;
&#43;        # Recursively hard-link the sources
&#43;        shutil.copytree(src, s, copy_function=3Dos.link)
&#43;}
&#43;
&#43;# Make sure that ti-pdk-source is unpacked before we set up the hardli=
nks.
&#43;python __anonymous () {
&#43;    pn =3D d.getVar('PN')
&#43;    pdk_src_pn =3D d.getVar('TI_PDK_SOURCE_PN')
&#43;    if pn !=3D pdk_src_pn:
&#43;        d.appendVarFlag('do_unpack', 'depends', ' ${TI_PDK_SOURCE_PN}:=
do_unpack')
&#43;}
diff --git a/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb b/recipes-bsp/t=
i-pdk-source/ti-pdk-source_git.bb
new file mode 100644
index 0000000..f4b3da9
--- /dev/null
&#43;&#43;&#43; b/recipes-bsp/ti-pdk-source/ti-pdk-source_git.bb
@@ -0,0 &#43;1,33 @@
&#43;# Recipe to fetch/unpack sources used by ti-pdk-fetch recipes.
&#43;#
&#43;# Mimic gcc-source.inc from oe-core.
&#43;
&#43;# These shources will be unpacked to a &quot;work-shared&quot; directo=
ry. Then each
&#43;# &quot;ti-pdk-fetch&quot; recipe will hard-link only the sources it r=
equires.
&#43;
&#43;deltask do_configure
&#43;deltask do_compile
&#43;deltask do_install
&#43;deltask do_populate_sysroot
&#43;deltask do_populate_lic
&#43;
&#43;RM_WORK_EXCLUDE &#43;=3D &quot;${PN}&quot;
&#43;EXCLUDE_FROM_WORLD =3D &quot;1&quot;
&#43;
&#43;inherit nopackages ti-pdk-fetch
&#43;
&#43;LICENSE =3D &quot;BSD-3-Clause&quot;
&#43;
&#43;PN =3D &quot;${TI_PDK_SOURCE_PN}&quot;
&#43;WORKDIR =3D &quot;${TI_PDK_SOURCE_WORKDIR}&quot;
&#43;SSTATE_SWSPEC =3D &quot;sstate:ti-pdk::${PV}:${PR}::${SSTATE_VERSION}:=
&quot;
&#43;
&#43;STAMP =3D &quot;${STAMPS_DIR}/work-shared/ti-pdk-${PV}&quot;
&#43;STAMPCLEAN =3D &quot;${STAMPS_DIR}/work-shared/ti-pdk-${PV}*&quot;
&#43;
&#43;INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;
&#43;DEPENDS =3D &quot;&quot;
&#43;PACKAGES =3D &quot;&quot;
&#43;
&#43;SRC_URI =3D &quot;${TI_PDK_GIT_URI};branch=3D${TI_PDK_GIT_BRANCH};prot=
ocol=3D${TI_PDK_GIT_PROTOCOL}&quot;
&#43;SRCREV =3D &quot;${TI_PDK_SRCREV}&quot;
</pre>
<br>
<fieldset class=3D"mimeAttachmentHeader"></fieldset>
<pre class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.

View/Reply Online (#12539): <a class=3D"moz-txt-link-freetext" href=3D"http=
s://lists.yoctoproject.org/g/meta-ti/message/12539">https://lists.yoctoproj=
ect.org/g/meta-ti/message/12539</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.y=
octoproject.org/mt/65159993/3619770">https://lists.yoctoproject.org/mt/6515=
9993/3619770</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:meta-ti&#=
43;owner@lists.yoctoproject.org">meta-ti&#43;owner@lists.yoctoproject.org</=
a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.yocto=
project.org/g/meta-ti/unsub">https://lists.yoctoproject.org/g/meta-ti/unsub=
</a>  [<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:j-stiffler@ti.c=
om">j-stiffler@ti.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
</pre>
</blockquote>
</div>
</body>
</html>

--_000_8cf2a7e197e44e5786d18235e54ae87femailandroidcom_--
