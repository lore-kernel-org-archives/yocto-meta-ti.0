Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
 by mx.groups.io with SMTP id smtpd.web08.40480.1629213198042696484
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Aug 2021 08:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=KjHP9r46;
 spf=pass (domain: amazon.com, ip: 99.78.197.218, mailfrom: prvs=856554f49=elberger@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1629213198; x=1660749198;
  h=to:from:subject:message-id:date:mime-version:
   content-transfer-encoding;
  bh=p42u9kC1rsWUpWFBAag2xDQpxK90y2Kj+ANE/IDvTCA=;
  b=KjHP9r46bmgx3s/6a9jWqM0Vi+m2AJHtv+/UewpC/zwk2IA7Q57OCNdf
   elC01JvythdA0jWmpA37RGNuPPHkdDo/qq7g0m41FGrq3F4KkJHNvoXLU
   lK/27M6ZkDssfsPsuLhyFKRqwRjLAEpjtISCVVV+s3+b9LROIcYc0hflg
   U=;
X-IronPort-AV: E=Sophos;i="5.84,329,1620691200"; 
   d="scan'208";a="19805305"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-2c-456ef9c9.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP; 17 Aug 2021 15:13:17 +0000
Received: from EX13MTAUWA001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-2c-456ef9c9.us-west-2.amazon.com (Postfix) with ESMTPS id 04258B91FB
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Aug 2021 15:13:16 +0000 (UTC)
Received: from EX13D01UWA002.ant.amazon.com (10.43.160.74) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Tue, 17 Aug 2021 15:13:16 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13d01UWA002.ant.amazon.com (10.43.160.74) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Tue, 17 Aug 2021 15:13:16 +0000
Received: from u795025edef875e.ant.amazon.com (10.106.179.6) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS) id
 15.0.1497.23 via Frontend Transport; Tue, 17 Aug 2021 15:13:16 +0000
To: <meta-ti@lists.yoctoproject.org>
From: elberger@amazon.com
Subject: Plan for meta-arago-distro (master)
Organization: Amazon Web Services
Message-ID: <61eb847a-1f5d-a4b9-7300-1350005ebe2f@amazon.com>
Date: Tue, 17 Aug 2021 11:13:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello,

I need to use master branch due to MACHINE configuration availability 
only on master.

However, the availability of new override syntax on meta-arago-distro 
emits the usual compatibility error.  I noticed there is no master-next 
branch so this is probably the state of things.

In such case

1/ is there a plan in motion to evolve meta-arago-distro and if so is 
there a rough timeline to have the syntax migrated

or

2/ is there a possibility to take a PR - not sure how TI handles this 
since there is probably full regression testing done.

thank you



