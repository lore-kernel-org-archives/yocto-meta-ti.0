Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.21741.1607636192653723050
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 13:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MaUq6Au+;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BALaVh2121685
	for <meta-ti@lists.yoctoproject.org>; Thu, 10 Dec 2020 15:36:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607636191;
	bh=tqR48+NnZCjJl2GF81xlo/7azEBZvjRz0mod9n7G3gc=;
	h=Subject:References:To:From:Date:In-Reply-To;
	b=MaUq6Au+7FGUKpwURfmbm9IQM1EB7IB6F5JU9kSUOmUtisYGKmlZQrhvOqx7/tJ+3
	 /AfyGzMVHJ1SA3OJKiZ0MyWf+/aAk2POgjnj3A1X2YkfpzEWb8EnAKqSs10d25V9gm
	 P/KXXPxdzKsIRoWq3KLif5OqQvuLF6FMtDxhSpAg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BALaV22004143
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 10 Dec 2020 15:36:31 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 15:36:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 15:36:31 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BALaVxG009098
	for <meta-ti@lists.yoctoproject.org>; Thu, 10 Dec 2020 15:36:31 -0600
Subject: [dunfell/master PATCH] trusted-firmware-a: Update to v2.4 merge
References: <20201210213348.30149-1-nm@ti.com>
To: <meta-ti@lists.yoctoproject.org>
From: "Dan Murphy" <dmurphy@ti.com>
X-Forwarded-Message-Id: <20201210213348.30149-1-nm@ti.com>
Message-ID: <75965ce5-23dc-19c3-4e88-993a13150cf1@ti.com>
Date: Thu, 10 Dec 2020 15:36:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201210213348.30149-1-nm@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------B2ECC348AD20A8A97A60B683"
Content-Language: en-US

--------------B2ECC348AD20A8A97A60B683
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Forward



-------- Forwarded Message --------
Subject: 	[dunfell/master PATCH] trusted-firmware-a: Update to v2.4 merge
Date: 	Thu, 10 Dec 2020 15:33:48 -0600
From: 	Nishanth Menon <nm@ti.com>
To: 	meta-ti@lists.yoctoproject.org
CC: 	praneeth@ti.com, d-gerlach@ti.com, s-anna@ti.com, dmurphy@ti.com, 
Nishanth Menon <nm@ti.com>



Update to v2.4 tag merge from upstream to keep TF-A in sync.

For major changes in trusted-firmware-a, See:
https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-4

TI specific fixups include:
- stub for shutdown (CPUs enter wfi)
- uart console is now configurable.

While at it, update to include PV as 2.4

Suggested-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 3 ++-
1 file changed, 2 insertions(+), 1 deletion(-)

diff --git 
a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend 
b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 3c1862643086..08b2e04ff711 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,6 +1,7 @@
+PV = "2.4"
BRANCH_k3 = "ti-atf"
SRC_URI_k3 = 
"git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
-SRCREV_tfa_k3 = "52c334fc361194e3896ea3b2529c10a06e586a5f"
+SRCREV_tfa_k3 = "f0a310d000fd6e8a1ed0ccc365b5931390393db1"
COMPATIBLE_MACHINE_k3 = "k3"
TFA_BUILD_TARGET_k3 = "all"
TFA_INSTALL_TARGET_k3 = "bl31"

-- 
2.25.1.377.g2d2118b814c1


--------------B2ECC348AD20A8A97A60B683
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=windows-1252">
  </head>
  <body>
    <p>Forward<br>
    </p>
    <div class="moz-forward-container"><br>
      <br>
      -------- Forwarded Message --------
      <table class="moz-email-headers-table" cellspacing="0"
        cellpadding="0" border="0">
        <tbody>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Subject:
            </th>
            <td>[dunfell/master PATCH] trusted-firmware-a: Update to
              v2.4 merge</td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Date: </th>
            <td>Thu, 10 Dec 2020 15:33:48 -0600</td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">From: </th>
            <td>Nishanth Menon <a class="moz-txt-link-rfc2396E" href="mailto:nm@ti.com">&lt;nm@ti.com&gt;</a></td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">To: </th>
            <td><a class="moz-txt-link-abbreviated" href="mailto:meta-ti@lists.yoctoproject.org">meta-ti@lists.yoctoproject.org</a></td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">CC: </th>
            <td><a class="moz-txt-link-abbreviated" href="mailto:praneeth@ti.com">praneeth@ti.com</a>, <a class="moz-txt-link-abbreviated" href="mailto:d-gerlach@ti.com">d-gerlach@ti.com</a>, <a class="moz-txt-link-abbreviated" href="mailto:s-anna@ti.com">s-anna@ti.com</a>,
              <a class="moz-txt-link-abbreviated" href="mailto:dmurphy@ti.com">dmurphy@ti.com</a>, Nishanth Menon <a class="moz-txt-link-rfc2396E" href="mailto:nm@ti.com">&lt;nm@ti.com&gt;</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      Update to v2.4 tag merge from upstream to keep TF-A in sync.<br>
      <br>
      For major changes in trusted-firmware-a, See:<br>
<a class="moz-txt-link-freetext" href="https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-4">https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-4</a><br>
      <br>
      TI specific fixups include:<br>
      - stub for shutdown (CPUs enter wfi)<br>
      - uart console is now configurable.<br>
      <br>
      While at it, update to include PV as 2.4<br>
      <br>
      Suggested-by: Dan Murphy <a class="moz-txt-link-rfc2396E" href="mailto:dmurphy@ti.com">&lt;dmurphy@ti.com&gt;</a><br>
      Signed-off-by: Nishanth Menon <a class="moz-txt-link-rfc2396E" href="mailto:nm@ti.com">&lt;nm@ti.com&gt;</a><br>
      ---<br>
      recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 3
      ++-<br>
      1 file changed, 2 insertions(+), 1 deletion(-)<br>
      <br>
      diff --git
      a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
      b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend<br>
      index 3c1862643086..08b2e04ff711 100644<br>
      --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend<br>
      +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend<br>
      @@ -1,6 +1,7 @@<br>
      +PV = "2.4"<br>
      BRANCH_k3 = "ti-atf"<br>
      SRC_URI_k3 =
"git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"<br>
      -SRCREV_tfa_k3 = "52c334fc361194e3896ea3b2529c10a06e586a5f"<br>
      +SRCREV_tfa_k3 = "f0a310d000fd6e8a1ed0ccc365b5931390393db1"<br>
      COMPATIBLE_MACHINE_k3 = "k3"<br>
      TFA_BUILD_TARGET_k3 = "all"<br>
      TFA_INSTALL_TARGET_k3 = "bl31"<br>
      <pre class="moz-signature">-- 
2.25.1.377.g2d2118b814c1

</pre>
    </div>
  </body>
</html>

--------------B2ECC348AD20A8A97A60B683--
