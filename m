Subject: jailhouse recipe removed for all platforms?
To: meta-ti@lists.yoctoproject.org
From: "Alan D Kozlay" <alan.kozlay@ves-solutions.com>
X-Originating-Location: Aberdeen, Maryland, US (100.16.210.137)
X-Originating-Platform: Linux Chrome 94
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 04 Oct 2021 17:10:33 -0700
Message-ID: <rENu.1633392633005298660.R6Z1@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="Fc8PwbcNbZxLrRLMMyeJ"

--Fc8PwbcNbZxLrRLMMyeJ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It appears that the jailhouse recipe was removed at Dunfell (latest release=
 in meta-ti) in 2021:

commit d8e96545f10bd2057b665a1e0c363f60f0a8cda5 Author: Nikhil Devshatwar <=
nikhil.nd@ti.com> Date: Tue Jun 15 16:42:44 2021 +0530 Jailhouse support is=
 dropped for K3 platforms, remove the
recipe and corresponding patches.

But the jailhouse project page on github indicates that it's supported on a=
 variety of boards other than just the K3 SOCs from TI.
Why was this recipe removed?

--Fc8PwbcNbZxLrRLMMyeJ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It appears that the jailhouse recipe was removed at Dunfell (latest release=
 in meta-ti) in 2021:<br /><br />
<div class=3D"msgBody" style=3D"color: #000000; font-family: helvetica, ari=
al, sans-serif;"><span style=3D"font-family: courier, courier new, monospac=
e;"><span style=3D"white-space: pre-wrap;">commit d8e96545f10bd2057b665a1e0=
c363f60f0a8cda5 Author: Nikhil Devshatwar &lt;nikhil.nd@ti.com&gt; Date: Tu=
e Jun 15 16:42:44 2021 +0530</span></span><span style=3D"color: #000000; fo=
nt-family: helvetica, arial, sans-serif;"><span style=3D"color: #000000; fo=
nt-family: helvetica, arial, sans-serif;">&nbsp;</span></span>
<pre style=3D"font-family: courier, 'courier new', monospace; font-size: 1e=
m; white-space: pre-wrap; margin-bottom: 0px;">Jailhouse support is dropped=
 for K3 platforms, remove the
recipe and corresponding patches.</pre>
</div>
<br />But the jailhouse project page on github indicates that it's supporte=
d on a variety of boards other than just the K3 SOCs from TI.<br />Why was =
this recipe removed?

--Fc8PwbcNbZxLrRLMMyeJ--
