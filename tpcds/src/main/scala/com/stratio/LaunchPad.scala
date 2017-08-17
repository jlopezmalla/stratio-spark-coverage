package com.stratio

import org.apache.spark.sql.SparkSession

object LaunchPad {

  def executeQuery(queryName: String, querySQL: String, executions: Int)(implicit session: SparkSession): List[(Int, String, Long)] = {

    (0 to executions).map(index => {
      val initTimer = System.currentTimeMillis()
      session.sql(querySQL).write.format("csv").option("path", s"output/$queryName/$initTimer").save
      (index, queryName, System.currentTimeMillis() - initTimer)
    }).toList

  }
}
