Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by mx.groups.io with SMTP id smtpd.web12.38837.1629205358542008092
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Aug 2021 06:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=uCkYgx3m;
 spf=pass (domain: amazon.com, ip: 52.95.48.154, mailfrom: prvs=856554f49=elberger@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1629205359; x=1660741359;
  h=to:from:subject:message-id:date:mime-version:
   content-transfer-encoding;
  bh=3tcybTNOSC5G6VUJ8ows9SyP8up5q9rf7ptQ1N7vnrQ=;
  b=uCkYgx3mZQQv74IBpAHVla2BS62uNNPYji9VhnNgqvgtsL4tLC4WFOLB
   1WO0/RVShp+lKBqYiNsa/CeDGIbMA61O2nBeHajJ9wHF9+yEUqAX4GeU5
   h5bMFfg9TcIAiSHH3NUcXM1fU6/3/JVj4/0winIDTxRY8qzq5jIsULtxN
   k=;
X-IronPort-AV: E=Sophos;i="5.84,328,1620691200"; 
   d="scan'208";a="134444867"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP; 17 Aug 2021 13:02:37 +0000
Received: from EX13MTAUWA001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
	by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS id D513EA190D
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Aug 2021 13:02:36 +0000 (UTC)
Received: from EX13P01UWA004.ant.amazon.com (10.43.160.127) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Tue, 17 Aug 2021 13:02:36 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13P01UWA004.ant.amazon.com (10.43.160.127) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Tue, 17 Aug 2021 13:02:35 +0000
Received: from u795025edef875e.ant.amazon.com (10.106.179.6) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS) id
 15.0.1497.23 via Frontend Transport; Tue, 17 Aug 2021 13:02:35 +0000
To: <meta-ti@lists.yoctoproject.org>
From: elberger@amazon.com
Subject: Correct MACHINE for
Organization: Amazon Web Services
Message-ID: <ffc46bcf-e291-3684-7964-e8b1958fe5b0@amazon.com>
Date: Tue, 17 Aug 2021 09:02:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello

I am looking for the correct MACHINE config for the TMDS64GPEVM.

At this page I do not see any reference to TMDS64GPEVM.

https://software-dl.ti.com/processor-sdk-linux/esd/AM64X/07_03_01_006/exports/docs/linux/Overview_Building_the_SDK.html#processor-sdk-build-reference

This is the SDK that the board's page points to from here

https://www.ti.com/tool/TMDS64GPEVM

I am also cloning the SDK using the processor-sdk-dunfell-07.01.00.txt 
config if that makes a difference.  Perhaps the configuration is on a 
different branch.

Thank you


